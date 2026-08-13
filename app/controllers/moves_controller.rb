class MovesController < ApplicationController
  def index
    @game = Game.find(params[:game_id])
  end

  def create
    @game = Game.find(params[:game_id])
    @game.make_move!(params[:position].to_i)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @game }
    end
  end
end
