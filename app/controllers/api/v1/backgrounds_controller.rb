class Api::V1::BackgroundsController < ApplicationController

  def show
    location = params[:location]
    search_location = location.gsub(",", "+")
    background_image_url = UnsplashService.new.get_image_for_location(search_location)
    data = {
            "data" => {
              "image_url" => background_image_url
              }
            }
    render json: data
  end
end
