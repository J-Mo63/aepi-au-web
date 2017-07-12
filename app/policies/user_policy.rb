class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, user_object)
    @user = user
    @user_object = user_object
  end

  def new?
    if user.present?
      user.admin?
    else
      false
    end
  end

  def create?
    if user.present?
      user.admin?
    else
      false
    end
  end
end
