class Api::V1::UsersController < ApplicationController

  require 'securerandom'

  def create
    if confirm_password?
      user = User.create!(email: params[:email],
                   password: params[:password],
                   api_key: SecureRandom.urlsafe_base64 )
                   
    else
      p "Sorry, could not finish your request"
    end
  end


  private

  def confirm_password?
    params[:password] == params[:password_confirmation]
  end
end
