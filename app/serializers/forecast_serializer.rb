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
             :next_eight_hours,
             :next_five_days
end
