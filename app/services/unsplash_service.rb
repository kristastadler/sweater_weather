class UnsplashService

  def conn
    Faraday.new(url: 'https://api.unsplash.com') do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.headers['Authorization'] = "Client-ID #{ENV['UNSPLASH_API']}"
    end
  end

  def get_image_for_location(location)
    response = conn.get("/search/photos?query=#{location}")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results].first[:urls][:regular]
  end
end
