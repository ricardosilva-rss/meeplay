class BoardgamesController < ApplicationController
  def index
    if params[:query].present?
      @boardgames = policy_scope(Boardgame.search_by_name_and_max_players(params[:query]))
    else
      @boardgames = policy_scope(Boardgame).sample(10)
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'boardgames/list', locals: { boardgames: @boardgames }, formats: [:html]  }
    end
  end

  def show
    @boardgame = Boardgame.find(params[:id])
    authorize @boardgame

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.json { render json: @boardgame.as_json }
    end
  end
end
