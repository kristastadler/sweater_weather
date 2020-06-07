class Api::V1::BackgroundsController < ApplicationController

  def show
    location = params[:location]
    search_query = location.gsub(",", "+")
    conn = Faraday.new(url: 'https://api.unsplash.com') do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.headers['Authorization'] = "Client-ID #{ENV['UNSPLASH_API']}"
    end

    response = conn.get("/search/photos?query=#{search_query}")

    json = JSON.parse(response.body, symbolize_names: true)
    background_image_url =  json[:results].first[:urls][:regular]
    require "pry"; binding.pry
  end
end
