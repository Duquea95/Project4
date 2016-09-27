class HomeController < ApplicationController

  def index
    network_id = "citi-bike-nyc"
    @response = CitybikesApi.network(network_id)
    @response = @response["network"]
    @bikelocations = []
    @empty_slots = 0

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
        @bikelocations.each do |location|
             @empty_slots = location["empty_slots"]
        end
    end
    # render json:
  end

end
