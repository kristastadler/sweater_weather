class Foodie
  attr_reader :end_location,
              :travel_time,
              :forecast,
              :id

  def initialize(location, travel_time, forecast, restaurant)
    @id = "null"
    @end_location = location
    @travel_time = travel_time
    @forecast = { summary: forecast.current_description,
                  temperature: forecast.current_temp }
  #  @restaurant = { name: restaurant.name,
  #                  address: [restaurant.address, restaurant.city, restaurant.zip].join(' ') }
  end
end
