class UserMeetingsController < ApplicationController
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
end
