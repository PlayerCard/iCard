class UserController < ApplicationController
  def show
    @user = current_user
    @profile = @user.profile
    if @profile.nil?
      redirect_to new_profile_path
    else
      redirect_to @profile
    end
  end
end
