class GoogleMapsService

  def conn(start, destination)
    Faraday.get("https://maps.googleapis.com/maps/api/directions/json") do |f|
      f.params['origin'] = start
      f.params['destination'] = destination
      f.params['key'] = ENV['GOOGLE_API_KEY']
    end
  end

  def get_trip_length
    
    json = JSON.parse(conn(start, destination).body, symbolize_names: true)
    json[:routes].first[:legs].first[:duration][:text]
  end

end
