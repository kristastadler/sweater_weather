class Api::V1::FoodieController < ApplicationController

  def index
    #Duration of trip
    conn = Faraday.get("https://maps.googleapis.com/maps/api/directions/json") do |f|
      f.params['origin'] = params[:start]
      f.params['destination'] = params[:end]
      f.params['key'] = ENV['GOOGLE_API_KEY']
    end
    json = JSON.parse(conn.body, symbolize_names: true)
    duration = json[:routes].first[:legs].first[:duration][:text]

    #Forecast at location
    end_location = params[:end]
    geocoordinates = GoogleGeocoderService.new.get_coordinates(end_location)
    forecast = OpenWeatherService.new.get_forecast(geocoordinates)
    summary = forecast.current_description
    temperature = forecast.current_temp

    #Restaurant at location
    conn2 = Faraday.get("https://developers.zomato.com/api/v2.1/search") do |f|
      f.headers['user_key'] = ENV['ZOMATO_API']
      f.params['lat'] = geocoordinates.latitude
      f.params['lon'] = geocoordinates.longitude
      f.params['cuisines'] = params[:search]
    end
    json = JSON.parse(conn2.body, symbolize_names: true)
    restaurant = Restaurant.new(json)

    foodie = Foodie.new(params[:end], duration, summary, temperature, restaurant)
    render json: FoodieSerializer.new(foodie)

  end

end
