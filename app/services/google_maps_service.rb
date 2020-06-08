class GoogleMapsService

  def conn(trip_params)
    Faraday.get("https://maps.googleapis.com/maps/api/directions/json") do |f|
      f.params['origin'] = trip_params[:start]
      f.params['destination'] = trip_params[:destination]
      f.params['key'] = ENV['GOOGLE_API_KEY']
    end
  end

  def get_trip_length(trip_params)
    json = JSON.parse(conn(trip_params).body, symbolize_names: true)
    json[:routes].first[:legs].first[:duration][:text]
  end

end
