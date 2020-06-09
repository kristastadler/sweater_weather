class ZomatoService

  def conn(geocoordinates, cuisine)
    Faraday.get("https://developers.zomato.com/api/v2.1/search") do |f|
      f.headers['user_key'] = ENV['ZOMATO_API']
      f.params['lat'] = geocoordinates.latitude
      f.params['lon'] = geocoordinates.longitude
      f.params['cuisines'] = cuisine
    end
  end

  def find_restaurant(geocoordinates, cuisine)
    json = JSON.parse(conn(geocoordinates, cuisine).body, symbolize_names: true)
    Restaurant.new(json)
  end
end
