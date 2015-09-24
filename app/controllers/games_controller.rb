class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :edit, :destroy]
  before_action :set_league, only: []
  before_action :set_teams, only: :new
  before_action :set_referees, only: :new

  def create
    @game = Game.new(game_params)
    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    @game.delete
    respond_to do |format|
      format.html { redirect_to league_games_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_league
      @league = League.find(params[:id])
    end

    def set_game
      @game = Game.find(params[:id])
    end

    def set_teams
      @teams = Team.all
    end

    def set_referees
      @referees =  Profile.where(role: 'referee').map{|profile| profile.user}
    end

    def game_params
      params.require(:game).permit(:game_time, :game_location, :referee_id, team_ids: [])
    end

end
