class Api::V1::ForecastController < ApplicationController

  def show
    location = params[:location]
    geocoordinates = GoogleGeocoderService.new.get_coordinates(location)
    forecast = OpenWeatherService.new.get_forecast(geocoordinates)
    render json: ForecastSerializer.new(forecast)
  end

end
