class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def show
    @managers = @team.team_memberships.where(is_manager: true)
    @current_lineup = @team.line_up
    @not_in_lineup = @team.team_memberships.where(in_line_up: false)
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team, notice: 'Team was successfully created.'
    else
      render :new
    end
  end

  def update
    in_lineup = params[:team][:team_memberships_attributes]
    lineup_count = 0
    in_lineup.each { |player| lineup_count += 1 if player[1][:in_line_up] == '1' }
    if lineup_count > 20
      flash.now[:alert] = "Cannot select more than 20 players for lineup, you selected #{lineup_count}."
      render :edit
    else
      if @team.update(team_params)
        redirect_to @team, notice: 'Team was successfully updated.'
      else
        render :edit
      end
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_url, notice: 'Team was successfully deleted.'
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, team_memberships_attributes: [:id, :player_id, :in_line_up])
  end
end
