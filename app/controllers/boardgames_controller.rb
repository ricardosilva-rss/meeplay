class BoardgamesController < ApplicationController




  def show
    @boardgame = Boardgame.find(params[:id])
    authorize @boardgame
  end
end
