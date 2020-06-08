require 'rails_helper'

describe 'Backgrounds API' do
  it "retrieves background image for a city" do
#After exam, go back and add VCR for testing purposes

    get "/api/v1/backgrounds?location=denver,co"

    expect(response).to be_successful

    background_url = JSON.parse(response.body)
  end
end
