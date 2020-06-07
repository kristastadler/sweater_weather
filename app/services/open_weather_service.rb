class OpenWeatherService

  def get_forecast(geocoordinates)
    conn = Faraday.get("https://api.openweathermap.org/data/2.5/onecall") do |f|
      f.params['lat'] = geocoordinates.latitude
      f.params['lon'] = geocoordinates.longitude
      f.params['exclude'] = 'minutely'
      f.params['appid'] = ENV['OPEN_WEATHER_KEY']
    end
    json = JSON.parse(conn.body, symbolize_names: true)
    forecast = Forecast.new(json)
  end 

end
