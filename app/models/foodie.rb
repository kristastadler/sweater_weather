class Foodie
  attr_reader :end_location,
              :travel_time,
              :forecast,
              :restaurant

  def initialize(location, travel_time, forecast, current_temp, restaurant)
    @end_location = location
    @travel_time = travel_time
    @forecast = { summary: forecast,
                  temperature: current_temp }
    @restaurant = { name: restaurant.name,
                    address: restaurant.address.concat(restaurant.city).concat(restaurant.zip) }
  end
end
