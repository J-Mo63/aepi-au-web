class ContactPolicy < ApplicationPolicy
	attr_reader :user, :contact

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, contact)
		@user = user
		@contact = contact
	end

	def new?
		true
	end

	def create?
		true
	end

	def edit?
		true
	end

	def update?
		true
	end

	def settings?
		user.admin?
	end
end
