class UsersController < ApplicationController

  skip_before_action :authenticate_request, :only => [:create_secret, :authorize_device]

  def create_secret
    command = SecretGenerator.call(ENV["APP_ANSWER_KEY"], ENV["APP_ID"])

    if command.success?
      render json: {
        access_token: command.result,
        message '??'
      }
    end
  end

  def authorize_device
    device_uuid = user_params[:device_uuid]
    secret = user_params[:key]
    authenticate device_uuid, secret
  end

  def test
    render json: {
      message: 'You have passed authentication and authorization test'
    }
  end

  private

  def authenticate(device_uuid, secret)
    command = AuthenticateDevice.call(device_uuid, secret)

    if command.success?
      render json: {
        access_token: command.result,
        message: 'Authorization Successful'
      }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def user_params
    params.permit(
       [:device_uuid, :key]
     )
   end
end
