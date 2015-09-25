class CardsController < ApplicationController
  before_action :set_game, only: [:new, :create]

  def new
    @card = Card.new
  end

  def create
    @card = @game.cards.build(card_params)
    if @card.save
      redirect_to game_path(@game), notice: 'Player successfully booked'
    else
      render :new, notice: 'Error creating card'
    end
  end

  def show
  end

  def edit
    if @card.update(card_params)
      redirect_to @card, notice: 'Game was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def card_params
    params.require(:card).permit(:color, :comments, :game_id, :player_id)
  end
end
