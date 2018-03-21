class ProfilesController < ApplicationController
  def index


  end

  private

  def profile_params
    params.permit(:name, :user_id)

  end

end
