class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current_temp,
             :high_temp,
             :low_temp,
             :current_description,
             :feels_like,
             :humidity,
             :uvi,
             :sunrise,
             :sunset,
             :hourly_forecast,
             :daily_forecast
end
