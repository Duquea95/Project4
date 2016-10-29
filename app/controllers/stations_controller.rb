class StationsController < ApplicationController
    def index
        ##
        ## Api call for NYC bikes only
        ##
        network_id = "citi-bike-nyc"
        @response = CitybikesApi.network(network_id)
        @response = @response["network"]
        @bikelocations = []
        # render json: @response
        if @response.present?
            if BikeNetwork.find_by_api_id(@response["id"]) == nil
                BikeNetwork.create(
                api_id: @response['id'],
                company_name: @response['name'],
                # city: @response['location']['city'],
                country: @response['location']['country'],
                latitude: @response['location']['latitude'],
                longitude: @response['location']['longitude']
                )
            end
            @bikelocations = @response["stations"][0..1000000000000]
            # render json: @bikelocations
            @bikelocations.each do |station|
                if BikeStation.find_by_station_id(station['extra']['uid']) == nil
                    BikeStation.create(
                        station_id: station["extra"]["uid"],
                        last_updated: station["timestamp"],
                        empty_slots: station["empty_slots"],
                        bikes_available: station["free_bikes"],
                        # total_slots: station["extra"]["totalDocks"],
                        latitude: station["latitude"],
                        longitude: station["longitude"],
                        # address: Geocoder.address(:latitude.to_f, :longitude.to_f),
                        gmaps: false
                      )
                  end
            end
          end
          @BikeStations = BikeStation.all
          @hash = Gmaps4rails.build_markers(@BikeStations) do |station, marker|
            marker.lat station.latitude
            marker.lng station.longitude
            marker.infowindow "Location: #{station.address}, Empty Slots: #{station.empty_slots},  Bikes Available: #{station.bikes_available},  Last Updated: #{station.last_updated}"
          end
    end
end
