class UserBoardgamesController < ApplicationController

  def index
    @user_boardgames = policy_scope(UserBoardgame)
  end

  def new
    @user_boardgame = UserBoardgame.new
    authorize @user_boardgame
  end

  def create
    @user_boardgame = UserBoardgame.new(user_boardgame_params)
    @user_boardgame.user = current_user
    authorize @user_boardgame
    if @user_boardgame.save!
      redirect_to user_boardgames_path, notice: "#{@user_boardgame.boardgame.name} added to collection."
    else
      render :new
    end
  end

  def destroy
    @user_boardgame = UserBoardgame.find(params[:id])
    @user_boardgame.destroy
    authorize @user_boardgame
    redirect_to user_boardgames_path, notice: "#{@user_boardgame.boardgame.name} removed from collection."
  end

  private

  def user_boardgame_params
    params.require(:user_boardgame).permit(:boardgame_id)
  end
end
