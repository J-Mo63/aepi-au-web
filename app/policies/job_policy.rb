class JobPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, job)
    @user = user
    @job = job
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    user.admin? || user.owner?(@job)
  end

  def update?
    user.admin? || user.owner?(@job)
  end

  def destroy?
    user.admin? || user.owner?(@job)
  end
end
