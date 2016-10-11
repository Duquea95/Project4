class HomeController < ApplicationController

  def index

##
## Going international ;)
##
    # @response = CitybikesApi.networks
    # @response = @response["networks"]
    # if @response.present?
    #     @response.each do |company|
    #         if BikeNetwork.find_by_api_id(company['id']) == nil
    #             BikeNetwork.create(
    #                 api_id: company['id'],
    #                 company_name: company['name'],
    #                 city: company['location']['city'],
    #                 country: company['location']['country'],
    #                 latitude: company['location']['latitude'],
    #                 longitude: company['location']['longitude']
    #             )
    #         end
    #     end
    # end

    # @networks = BikeNetwork.all
    # @networks.each do |network|
    #     @id = network["api_id"]
    #     @res2 = CitybikesApi.network(@id)
    #     @res2 = @res2["network"]
    # end
    # render json: @res2

##
## Api call for NYC bikes only
##
    network_id = "citi-bike-nyc"
    @response = CitybikesApi.network(network_id)
    @response = @response["network"]
    @bikelocations = []
    if @response.present?
        if BikeNetwork.find_by_api_id(@response["id"]) == nil
            BikeNetwork.create(
            api_id: @response['id'],
            company_name: @response['name'],
            city: @response['location']['city'],
            country: @response['location']['country'],
            latitude: @response['location']['latitude'],
            longitude: @response['location']['longitude']
            )
        end
        @bikelocations = @response["stations"][0..1000000000000]
        @bikelocations.each do |station|
            if BikeStation.find_by_station_id(station['extra']['uid']) == nil
                BikeStation.create(
                    station_id: station["extra"]["uid"],
                    total_slots: station["extra"]["totalDocks"],
                    address: station["extra"]["stAddress1"].gsub(/\u0026 /, ''),
                    last_updated: station["extra"]["lastCommunicationTime"],
                    empty_slots: station["empty_slots"],
                    bikes_available: station["free_bikes"],
                    latitude: station["latitude"],
                    longitude: station["longitude"],
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
