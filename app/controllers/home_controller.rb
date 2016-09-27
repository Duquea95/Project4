class HomeController < ApplicationController

  def index
    network_id = "citi-bike-nyc"
    @response = CitybikesApi.network(network_id)
    @response = @response["network"]
    @bikelocations = []
    @empty_slots = []
    @total_slots = []
    @bikes_available = []
    @bikeStationsLatitude = []
    @bikeStationsLongitude = []
    @address = []
    @lastUpdated = []
    @station_id = []

    if @response.present?
        if BikeNetwork.find_by_api_id(@response['id']) == nil
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
                    longitude: station["longitude"]
                )
            end
        end
    end
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
    end
  end

end
