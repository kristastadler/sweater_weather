require 'rails_helper'

describe 'Backgrounds API' do
  it "retrieves background image for a city" do
    VCR.use_cassette('background_image_for_city') do

      get "/api/v1/backgrounds?location=denver,co"

      expect(response).to be_successful

      background_url = JSON.parse(response.body, symbolize_names: true)
      expect(background_url[:data][:image_url]).to_not eq("nil")
    end
  end
end
