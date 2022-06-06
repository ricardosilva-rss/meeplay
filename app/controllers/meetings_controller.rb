class MeetingsController < ApplicationController
  before_action :set_meeting, only: [ :show, :edit, :update, :destroy, ]

  def index
    if params[:query].present?
      @meetings = policy_scope(Meeting.search_by_name_and_address_and_host(params[:query])).sort_by { |meeting| meeting.distance_to(current_user.profile.city) }
    else
      nearby_meetings = policy_scope(Meeting).order(start_date: :asc).order(start_time: :asc).near(current_user.profile.city)
      other_meetings = policy_scope(Meeting).near(current_user.profile.city, 5000) - nearby_meetings
      @meetings = nearby_meetings + other_meetings
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'meetings/list', locals: { meetings: @meetings }, formats: [:html] }
    end
  end

  def show
    @user = User.where(params[:user])

    @user_meeting = UserMeeting.where(meeting_id: @meeting.id).select do |user_meeting|
      user_meeting.user == current_user
    end

    @user_meeting = UserMeeting.new unless @user_meeting.present?

    @marker = @meeting.geocode.map do
      {
        lat: @meeting.latitude,
        lng: @meeting.longitude
      }
    end
  end

  def new
    @meeting = Meeting.new
    authorize @meeting
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user = current_user
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

  def my_meetings
    @meetings = policy_scope(current_user.meetings)
    authorize @meetings
  end

  def calendar
    @meetings = policy_scope(current_user.meetings)
    authorize @meetings
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
