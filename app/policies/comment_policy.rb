class CommentPolicy < ApplicationPolicy
    attr_reader :user, :comment

    class Scope < Scope
        def resolve
            scope.all
        end
    end

    def initialize(user, comment)
        @user = user
        @comment = comment
    end

    def edit?
        user.owner_admin?(@comment)
    end

    def update?
        user.owner_admin?(@comment)
    end

    def destroy?
        user.owner_admin?(@comment)
    end
end
