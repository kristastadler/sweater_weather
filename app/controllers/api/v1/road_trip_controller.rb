class Api::V1::RoadTripController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @parsed = JSON.parse(request.body.reduce, symbolize_names: true)
    if find_user != nil
      duration = GoogleMapsService.new.get_trip_length(road_trip_params)
      geocoordinates = GoogleGeocoderService.new.get_coordinates(road_trip_params[:destination])
      forecast = OpenWeatherService.new.get_forecast(geocoordinates)
      roadtrip = RoadTrip.new(road_trip_params, duration, forecast)
      render json: RoadTripSerializer.new(roadtrip)

    else
      create_error = {
              "error_message" => "Unauthorized Request"
             }
      render json: create_error, status: 401
    end
  end

  private

  def find_user
    User.find_by_api_key(@parsed[:api_key])
  end

  def road_trip_params
    { start: @parsed[:origin],
      destination: @parsed[:destination] }
  end

end
