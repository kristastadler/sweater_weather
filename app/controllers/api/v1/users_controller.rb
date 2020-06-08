class Api::V1::UsersController < ApplicationController

  require 'securerandom'

  def create
    if confirm_password?
      user = User.new(email: params[:email],
                   password: params[:password],
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


  private

  def confirm_password?
    params[:password] == params[:password_confirmation]
  end
end
