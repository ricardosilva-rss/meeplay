class PlayersWantedValidator < ActiveModel::Validator
  def validate(record)
    max_players = record.meeting.players_wanted
    meeting = record.meeting
    number_of_players = meeting.users.count
    if (number_of_players + 1) > max_players
      record.errors.add(
        :user_meeting,
        "Meeting is full"
      )
    end
  end
end
