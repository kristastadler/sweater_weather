class Api::V1::UsersController < ApplicationController

  require 'securerandom'

  def create
    body = request.body.as_json
    @parsed = JSON.parse(body.first, symbolize_names: true)

    if confirm_password?
      user = User.new(email: @parsed[:email],
                   password: @parsed[:password],
                   api_key: SecureRandom.urlsafe_base64 )
      if user.save
        render json: UserSerializer.new(user), status: :created
      else
        create_error = {
                "error_message" => user.errors.full_messages.to_sentence
               }
        render json: create_error, status: 400
      end
    else
      password_error = {
              "error_message" => "Password and password confirmation must match"
             }
      render json: password_error, status: 400
    end
  end

  def show
    body = request.body.as_json
    @parsed = JSON.parse(body.first, symbolize_names: true)

    user = User.find_by_email(@parsed[:email])
    if user.authenticate(@parsed[:password])
      render json: UserSerializer.new(user)
    else
      create_error = {
              "error_message" => "Credentials are bad"
             }
      render json: create_error, status: 400
    end
  end

  private

  def confirm_password?
    @parsed[:password] == @parsed[:password_confirmation]
  end
end
