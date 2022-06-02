class UserMeetingsController < ApplicationController
  before_action :set_user_meeting, only: [:destroy]
  def create
    @meeting = Meeting.find(params[:meeting_id])
    @user = current_user
    @user_meeting = UserMeeting.new(user: @user, meeting: @meeting)
    authorize @user_meeting
    if @user_meeting.save
      redirect_to meeting_path(@meeting), notice: 'Meeting was successfully joined.'
    else
      render "meetings/show"
    end
  end

  def destroy
    @user_meeting.destroy
    @meeting = @user_meeting.meeting
    redirect_to meeting_path(@meeting), notice: "You left #{@user_meeting.meeting.name}."
  end

  private

  def set_user_meeting
    @user_meeting = UserMeeting.find_by(id: params[:id])
    authorize @user_meeting
  end
end
