class EventPolicy < ApplicationPolicy
	attr_reader :user, :event

  class Scope < Scope
    def resolve
    	if @user.bank_signatory || @user.owner?(@event) || @user.admin?
    		scope.all
    	else
      	scope.where(is_approved: true)
      end
    end
  end

  def initialize(user, event)
		@user = user
		@event = event
	end

	def show?
		true
	end

	def new?
		true
	end

	def create?
		true
	end

	def edit?
		@user.owner?(@event)
	end

	def update?
		@user.owner?(@event)
	end

	def destroy?
		@user.owner?(@event) || @user.admin?
	end

	def toggle_approve?
		@user.bank_signatory || @user.admin?
	end
end
