class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :new, :create]

  def new
    @profile = Profile.new
  end

  def show
    @profile = @user.profile
  end

  def create
    @profile = @user.build_profile(profile_params)
    if @profile.save
      redirect_to @profile, notice: "Profile was successfully created."
    else
      render :new
    end
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