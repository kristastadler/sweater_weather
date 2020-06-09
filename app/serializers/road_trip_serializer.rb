class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  set_type :road_trip
  set_id :id
  attributes :origin, :destination, :travel_time, :destination_forecast
end
