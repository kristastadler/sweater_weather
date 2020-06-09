class Api::V1::RoadTripController < ApplicationController

  def show
    if find_user =! nil
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
    User.find_by_api_key(params[:api_key])
  end

  def road_trip_params
    { start: params[:origin],
      destination: params[:destination] }
  end

end
