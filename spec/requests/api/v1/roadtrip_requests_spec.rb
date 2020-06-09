require 'rails_helper'

describe 'Roadtrip API' do
  it "retrieves travel time and arrival forecast for a road trip" do
    user = User.create(email: "whatever@example.com",
                      api_key: "q1tQHkkMyKpfYPqWD7-2cQ4",
                      password: "better_password")

    post '/api/v1/road_trip', params: { origin: "Denver, CO",
      destination: "Pueblo, CO",
      api_key: "q1tQHklMyKpfYPqWD7-2cQ4" }

    results = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(results[:data][:type]).to eq("road_trip")
    expect(results[:data][:attributes][:origin]).to eq("Denver, CO")
    expect(results[:data][:attributes][:destination]).to eq("Pueblo, CO")
    expect(results[:data][:attributes][:travel_time]).to eq("1 hour 48 mins")
    expect(results[:data][:attributes][:destination_forecast][:summary]).to_not eq("nil")
    expect(results[:data][:attributes][:destination_forecast][:temperature]).to_not eq("nil")
  end
end
