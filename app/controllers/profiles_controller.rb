class ProfilesController < ApplicationController
  def index
    profiles = Profile.all
    render json: {
      profiles: profiles
    }
  end

  private

  def profile_params
    params.permit(:name, :user_id)
  end

end
