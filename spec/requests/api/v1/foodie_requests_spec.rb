require 'rails_helper'

describe 'Foodie API' do
  xit "retrieves food and forecast information for a destination city" do
    VCR.use_cassette('foodie_request') do

      get "/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian"
      results = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(results[:data][:id]).to eq("null")
      expect(results[:data][:type]).to eq("foodie")
      expect(results[:data][:attributes][:end_location]).to eq("pueblo,co")
      expect(results[:data][:attributes][:travel_time]).to eq("1 hour 48 mins")
    end
  end
end
