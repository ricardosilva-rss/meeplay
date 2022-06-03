class UserMeetingsValidator < ActiveModel::Validator
  def validate(record)

    start_date = record.meeting.start_date
    start_time = record.meeting.start_time
    user = record.user
    user_appointments = Meeting.where(user: user, start_date: start_date, start_time: start_time)
    if user_appointments.any?
      record.errors.add(
        :user_meeting,
        "You already have a meeting at that time"
      )
    end
  end
end
