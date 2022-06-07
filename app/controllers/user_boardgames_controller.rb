class UserBoardgamesController < ApplicationController
  def index
    @user_boardgames = policy_scope(UserBoardgame)
  end
end
