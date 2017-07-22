class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
				scope.all
			else
				scope.none
			end
    end
  end

  def initialize(user, user_object)
    @user = user
    @user_object = user_object
  end

  def index?
    if user.present?
      user.admin?
    else
      false
    end
  end

  def update?
    if user.present?
      user.admin?
    else
      false
    end
  end

  def destroy?
    if user.present?
      user.admin?
    else
      false
    end
  end
end
