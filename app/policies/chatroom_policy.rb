class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.of_current_user(user)
    end
  end

  def show?
    user.in? record.meeting.users
  end
end
