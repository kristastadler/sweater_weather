class Api::V1::FoodieController < ApplicationController

  def index
    duration = GoogleMapsService.new.get_trip_length(trip_params)

    #Forecast at location

    geocoordinates = GoogleGeocoderService.new.get_coordinates(trip_params[:destination])
    forecast = OpenWeatherService.new.get_forecast(geocoordinates)
    # summary = forecast.current_description
    # temperature = forecast.current_temp

    #Restaurant at location
    conn2 = Faraday.get("https://developers.zomato.com/api/v2.1/search") do |f|
      f.headers['user_key'] = ENV['ZOMATO_API']
      f.params['lat'] = geocoordinates.latitude
      f.params['lon'] = geocoordinates.longitude
      f.params['cuisines'] = trip_params[:cuisine]
    end
    json = JSON.parse(conn2.body, symbolize_names: true)
    restaurant = Restaurant.new(json)

    foodie = Foodie.new(trip_params[:destination], duration, forecast, restaurant)
    render json: FoodieSerializer.new(foodie)

  end

  private

  def trip_params
    { start: params[:start],
      destination: params[:end],
      cuisine: params[:search]}
  end

end
