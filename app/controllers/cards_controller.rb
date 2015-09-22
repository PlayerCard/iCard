class CardsController < ApplicationController
  before_action :set_game_and_user, only: []

  def create
    @card = Card.new(params.require(:game).permit(:color, :comments, :player_id, :game_id))

    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
  end

  def show
  end

  def edit
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user_and_game
      @user = User.find(params[:id])
      @game = Game.find(params[:id])
    end

    def set_player
      @player = Player.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:color, :comments, :player_id, :game_id)
    end
end
