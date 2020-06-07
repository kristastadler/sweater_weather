class Api::V1::ForecastController < ApplicationController

  def show
    location = params[:location]
    geocoordinates = GoogleGeocoderService.new.get_coordinates(location)

    conn_2 = Faraday.get("https://api.openweathermap.org/data/2.5/onecall") do |f|
      f.params['lat'] = geocoordinates.latitude
      f.params['lon'] = geocoordinates.longitude
      f.params['exclude'] = 'minutely'
      f.params['appid'] = ENV['OPEN_WEATHER_KEY']
    end
    json_2 = JSON.parse(conn_2.body, symbolize_names: true)

    forecast = Forecast.new(json_2)

    render json: ForecastSerializer.new(forecast)
  end

end
