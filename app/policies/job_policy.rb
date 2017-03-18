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
        user.admin?
    end

    def create?
        user.admin?
    end

    def edit?
        user.admin?
    end

    def update?
        user.admin?
    end

    def destroy?
        user.admin?
    end
end
