class CardsController < ApplicationController
  before_action :set_game, only: [:new, :create]

  def create
    @card = @game.cards.build(card_params)

    respond_to do |format|
      if @card.save
        format.json { render json: @card, status: 200 }
      else
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
    def set_game
      @game = Game.find(params[:id])
    end

    # def set_player
    #   @player = Player.find(params[:id])
    # end

    def card_params
      params.require(:card).permit(:color, :comments, :user_id)
    end
end
