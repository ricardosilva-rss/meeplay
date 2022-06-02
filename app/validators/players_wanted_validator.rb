class PlayersWantedValidator < ActiveModel::Validator
  def validate(record)
    max_players = record.meeting.players_wanted
    meeting = record.meeting
    number_of_players = UserMeeting.where(meeting: meeting).count
    if number_of_players > (max_players + 1)
      record.errors.add(
        :user_meeting,
        "Meeting is full"
      )
    end
  end
end
