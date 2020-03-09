class BlacklistPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # scope.where(user: user)
    end
  end

  def index?
    true
  end

  def show?
    true
  end
end
