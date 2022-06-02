class MeetingsController < ApplicationController
  before_action :set_meeting, only: [ :show, :edit, :update, :destroy ]

  def index
    @meetings = policy_scope(Meeting).order(created_at: :desc)
  end

  def show
    @user = User.where(params[:user])
  end

  def new
    @meeting = Meeting.new
    authorize @meeting
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user = current_user
    # UserMeetings.create(user: current_user, meeting: @meeting)
    @meeting.chatroom = Chatroom.new
    authorize @meeting

    if @meeting.save!
      redirect_to meeting_path(@meeting), notice: 'meeting was successfully scheduled.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @meeting.update(meeting_params)
      redirect_to meeting_path(@meeting), notice: 'meeting was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @meeting.destroy
    redirect_to meetings_path, notice: "#{@meeting.name} was successfully canceled."
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
