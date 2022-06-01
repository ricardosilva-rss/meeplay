class MeetingsController < ApplicationController
  before_action :set_meeting, only: [ :show ]

  def index
    @meetings = policy_scope(Meeting).order(created_at: :desc)
  end

  def show
    @user = User.where(params[:user])
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
    authorize @meeting
  end
end
