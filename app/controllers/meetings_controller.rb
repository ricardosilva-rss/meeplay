class MeetingsController < ApplicationController
  before_action :set_meeting, only: [ :show ]

  def index
    @meetings = policy_scope(Meeting).order(created_at: :desc)
  end

  def show; end

  def new
    @meeting = Meeting.new
    authorize @meeting
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user_id = current_user
    authorize @meeting

    if @meeting.save
      redirect_to meeting_path(@meeting), notice: 'Meeting was successfully scheduale.'
    else
      render :new
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:name, :boardgame_id.name, :start_date, :start_time, :players_wanted, :user_is_owner, :address, :description)
  end

  def set_meeting
    @meeting = Meeting.find(params[:id])
    authorize @meeting
  end
end
