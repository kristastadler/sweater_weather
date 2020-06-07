require 'rails_helper'

describe 'Weather API' do
  it "retrieves weather information for a city" do
#After exam, go back and add VCR for testing purposes

    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    weather = JSON.parse(response.body)
    require "pry"; binding.pry
  end
end
