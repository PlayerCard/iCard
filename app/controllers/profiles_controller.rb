class ProfilesController < ApplicationController
  before_action :set_user, only: [:new, :show]

  def new
    @profile = @user.create_profile(profile_params)
  end

  def show
    @profile = @user.profile
  end

  private

  def profile_params
    params.require(:profile).permit(:picture_url, :role, :name,
                                    :address_1, :address_2, :city, :state, :zip)
  end

  def set_user
    @user = current_user
  end
end
