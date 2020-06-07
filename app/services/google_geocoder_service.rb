class GoogleGeocoderService

  def get_coordinates(location)
    conn = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json") do |f|
      f.params['address'] = location
      f.params['key'] = ENV['GOOGLE_API_KEY']
    end
    json = JSON.parse(conn.body, symbolize_names: true)
    coordinates = Geocoordinates.new(json)
  end

  end
