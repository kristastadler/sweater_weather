require 'rails_helper'

describe 'Weather API' do
  it "retrieves weather information for a city" do
    VCR.use_cassette('weather') do

      get "/api/v1/forecast?location=denver,co"

      expect(response).to be_successful

      weather = JSON.parse(response.body, symbolize_names: true)
      expect(weather[:data][:type]).to eq("forecast")
      expect(weather[:data][:attributes][:current_temp]).to eq(49)
      expect(weather[:data][:attributes][:high_temp]).to eq(65)
      expect(weather[:data][:attributes][:current_description]).to eq("Clouds")
    end
  end
end
