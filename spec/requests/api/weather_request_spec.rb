require 'rails_helper'

describe 'Weather API' do
  it "retrieves weather information for a city" do

    get "/api/v1/forecast?location=denver,co"

    expect (response).to be_successful

    weather = JSON.parse(response.body)
  end
end
