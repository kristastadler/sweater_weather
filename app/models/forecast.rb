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
              :hourly_forecast,
              :next_eight_hours,
              :next_five_days,
              :daily_forecast,
              :id,
              :city,
              :date_time


  def initialize(attributes, location)
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
    @id = "null"
    @city = location
    @date_time = DateTime.strptime(attributes[:current][:dt].to_s, '%s')

  end

  def hourly_forecast
    hourly_forecast = []
    next_eight_hours.each do |hour|
      hourly_forecast << { date_time: DateTime.strptime(hour[:dt].to_s, '%s'),
                          description: hour[:weather].first[:main],
                          temperature: (hour[:temp] / 0.55555556 - 459.67).round(0) }

    end
    hourly_forecast
  end

  def daily_forecast
    daily_forecast = []
    next_five_days.each do |day|
      daily_forecast << { date: Date.strptime(day[:dt].to_s, '%s'),
                          description: day[:weather].first[:main],
                          rain_accumulation: day[:rain],
                          high_temp: (day[:temp][:max] / 0.55555556 - 459.67).round(0),
                          low_temp: (day[:temp][:min] / 0.55555556 - 459.67).round(0) }
    end
    daily_forecast
  end

end
