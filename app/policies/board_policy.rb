class BoardPolicy < ApplicationPolicy
    attr_reader :user, :board

    class Scope < Scope
        def resolve
            scope.all
        end
    end

    def initialize(user, board)
        @user = user
        @board = board
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
