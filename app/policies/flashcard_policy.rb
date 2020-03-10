class FlashcardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def index?
  #   true
  # end

  def show?
    true
  end

  def update?
    # record.user == user
    return true
  end
end
