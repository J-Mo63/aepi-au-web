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

	def toggle_approved?
		@user.bank_signatory || @user.admin?
	end
end
