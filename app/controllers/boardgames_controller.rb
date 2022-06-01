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
end
