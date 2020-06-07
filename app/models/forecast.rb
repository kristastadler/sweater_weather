class Forecast
  attr_reader :current_temp,
              :high_temp,
              :low_temp,
              :current_description,
              :feels_like,
              :humidity,
              :uvi,
              :sunrise,
              :sunset,
              :next_eight_hours,
              :next_five_days,
              :id


  def initialize(attributes)
    @current_temp = (attributes[:current][:temp] / 0.55555556 - 459.67).round(0)
    @high_temp = (attributes[:daily].first[:temp][:max] / 0.55555556 - 459.67).round(0)
    @low_temp = (attributes[:daily].first[:temp][:min] / 0.55555556 - 459.67).round(0)
    @current_description = attributes[:current][:weather].first[:main]
    @feels_like = (attributes[:current][:feels_like] / 0.55555556 - 459.67).round(0)
    @humidity = attributes[:current][:humidity]
    @uvi = attributes[:current][:uvi]
    @sunrise = attributes[:current][:sunrise]
    @sunset = attributes[:current][:sunset]
    @next_eight_hours = attributes[:hourly].take(8)
    @next_five_days = attributes[:daily].take(5)
    @id = 1
  end
end
