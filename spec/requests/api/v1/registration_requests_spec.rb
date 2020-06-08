require 'rails_helper'

describe 'Users API' do
  it "registers a user in the database and returns their login information" do

    post '/api/v1/users', params: { email: "whatever@example.com",
      password: "password",
      password_confirmation: "password" }

    expect(response).to be_successful
    expect(response.status).to eq(201)

    body = JSON.parse(response.body)

  end

  it "does not register a user if the password and password confirmation do not match" do

    post '/api/v1/users', params: { email: "whatever@example.com",
      password: "password",
      password_confirmation: "passwrod" }

    body = JSON.parse(response.body)
    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(body["error_message"]).to eq("Password and password confirmation must match")

  end

  it "does not register a user if the password and password confirmation do not match" do
    user = User.create(email: "whatever@example.com",
                      api_key: "q1tQHkkMyKpfYPqWD7-2cQ4",
                      password: "password")

    post '/api/v1/users', params: { email: "whatever@example.com",
      password: "password",
      password_confirmation: "password" }

    body = JSON.parse(response.body)
    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(body["error_message"]).to eq("Email has already been taken")
  end

  it "returns a users information when a session is started" do
    user = User.create(email: "whatever@example.com",
                      api_key: "q1tQHkkMyKpfYPqWD7-2cQ4",
                      password: "password")

    post '/api/v1/sessions', params { email: "whatever@example.com",
                                      password: "password" }

    body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(body[:data][:type]).to eq("users")
    expect(body[:data][:id]).to eq(user.id)
    expect(body[:data][:attributes][:email]).to eq(user.email)
    expect(body[:data][:attributes][:api_key]).to eq(user.api_key)

  end

end
