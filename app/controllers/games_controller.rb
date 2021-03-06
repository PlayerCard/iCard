class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :edit, :destroy]
  before_action :set_teams, only: [:show, :new, :index, :edit, :update]
  before_action :set_referees, only: [:new, :edit, :update]

  def index
    @games = Game.all
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @game.update(game_params)
      redirect_to @game, notice: 'Game was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @game.delete
    redirect_to games_path, notice: 'Game was successfully deleted.'
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def set_teams
    @teams = Team.all
  end

  def set_referees
    @referees = Profile.where(role: 'referee').map(&:user)
  end

  def game_params
    params.require(:game).permit(:game_time, :game_location, :referee_id,
                                 team_ids: [], home_player_ids: [],
                                 away_player_ids: [])
  end
end
