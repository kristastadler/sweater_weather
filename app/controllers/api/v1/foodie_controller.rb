class Api::V1::FoodieController < ApplicationController

  def index
    duration = GoogleMapsService.new.get_trip_length(trip_params)
    geocoordinates = GoogleGeocoderService.new.get_coordinates(trip_params[:destination])
    forecast = OpenWeatherService.new.get_forecast(geocoordinates)
    restaurant = ZomatoService.new.find_restaurant(geocoordinates, trip_params[:cuisine])
    foodie = Foodie.new(trip_params[:destination], duration, forecast, restaurant)
#    options[:is_collection] = true
    render json: FoodieSerializer.new([foodie, restaurant])
  end

  private

  def trip_params
    { start: params[:start],
      destination: params[:end],
      cuisine: params[:search]}
  end

end
