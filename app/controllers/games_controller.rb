class GamesController < ApplicationController
  def new; end

  def create
    game = Game.create!
    redirect_to game
  end

  def show
    @game = Game.find(params[:id])
  end

  def reset
    game = Game.find(params[:id])
    game.reset!
    redirect_to game
  end
end
