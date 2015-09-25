class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @managers = @team.team_memberships.where(is_manager: true)
    @current_lineup = @team.line_up
    @not_in_lineup = @team.team_memberships.where(in_line_up: false)
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    in_lineup = params[:team][:team_memberships_attributes]
    lineup_count = 0
    in_lineup.each { |player| lineup_count += 1 if player[1][:in_line_up] == '1'}
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

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, team_memberships_attributes: [:id, :player_id, :in_line_up])
    end
end
