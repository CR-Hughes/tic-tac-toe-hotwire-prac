class MovesController < ApplicationController
  def create
    @game = Game.find(params[:game_id])

    @game.make_move!(params[:position].to_i)
    redirect_to @game
  end
end
