require 'rails_helper'

describe 'Registration API' do
  it "registers a user in the database and returns their login information" do
    # json = {"data" =>
    #   { "email": "whatever@example.com",
    #     "password": "password",
    #     "password_confirmation": "password"}}

    post '/api/v1/users', params: { email: "whatever@example.com",
      password: "password",
      password_confirmation: "password" }

    expect(response).to be_successful
    expect(response.status).to eq(201)

    body = JSON.parse(response.body)

    require "pry"; binding.pry
  end
end
