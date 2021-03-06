class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :new, :create, :edit]

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def show
    @profile = Profile.find(params[:id])
    @yellow_cards = @profile.user.cards.select { |card| card.color == 'yellow' || card.color == 'Yellow' }
    @red_cards = @profile.user.cards.select { |card| card.color == 'red' || card.color == 'Red' }
    @black_cards = @profile.user.cards.select { |card| card.color == 'black' || card.color == 'Black' }
    @team_member = @profile.user.team_memberships.all
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
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
    params.require(:profile).permit(:picture, :role, :name,
                                    :address_1, :address_2, :city, :state, :zip)
  end

  def set_user
    @user = current_user
  end
end
