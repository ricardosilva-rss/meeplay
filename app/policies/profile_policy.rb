class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    return true
  end

  def create?
    return true
  end

  def update?
    owner_or_admin?
  end

  private

  def owner_or_admin?
    record.user == user
  end
end
