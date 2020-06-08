require 'rails_helper'

describe 'Foodie API' do
  it "retrieves food and forecast information for a destination city" do

    get "/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian"
    results = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
    expect(response).to be_successful
    expect(results[:data][:id]).to eq("null")
    expect(results[:data][:type]).to eq("foodie")
    expect(results[:data][:attributes][:end_location]).to eq("pueblo,co")
    expect(results[:data][:restaurant][:address].downcase).to include("pueblo")

  end
end
