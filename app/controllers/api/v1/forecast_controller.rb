class Api::V1::ForecastController < ApplicationController

  def show
    location = params[:location]
    conn = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json") do |f|
      f.params['address'] = location
      f.params['key'] = ENV['GOOGLE_API_KEY']
    end
    json = JSON.parse(conn.body, symbolize_names: true)
    latitude = json[:results].first[:geometry][:location][:lat]
    longitude = json[:results].first[:geometry][:location][:lng]

    conn_2 = Faraday.get("https://api.openweathermap.org/data/2.5/onecall") do |f|
      f.params['lat'] = latitude
      f.params['lon'] = longitude
      f.params['exclude'] = 'minutely'
      f.params['appid'] = ENV['OPEN_WEATHER_KEY']
    end
    json_2 = JSON.parse(conn_2.body, symbolize_names: true)

    forecast = Forecast.new(json_2)

    require "pry"; binding.pry
  end

end
