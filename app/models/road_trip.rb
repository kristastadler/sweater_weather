class RoadTrip
  attr_reader :origin,
              :destination,
              :travel_time,
              :destination_forecast,
              :id

  def initialize(trip_details, travel_time, forecast)
    @origin = trip_details[:start]
    @destination = trip_details[:destination]
    @travel_time = travel_time
    @destination_forecast = { summary: forecast.current_description,
                             temperature: forecast.current_temp}
    @id = "null"
  end

end
