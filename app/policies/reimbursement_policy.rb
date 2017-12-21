class ReimbursementPolicy < ApplicationPolicy
	attr_reader :user, :reimbursement

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, reimbursement)
		@user = user
		@reimbursement = reimbursement
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
end
