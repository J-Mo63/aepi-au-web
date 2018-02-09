class ReimbursementPolicy < ApplicationPolicy
	attr_reader :user, :reimbursement

  class Scope < Scope
    def resolve
    	if @user.bank_signatory
    		scope.all
    	else
      	scope.where(user_id: @user.id)
      end
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
		@user.owner?(@reimbursement)
	end

	def destroy?
		@user.admin?
	end

	def update?
		@user.owner?(@reimbursement)
	end

	def toggle_process?
		@user.bank_signatory
	end
end
