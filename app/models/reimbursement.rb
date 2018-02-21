class Reimbursement < ApplicationRecord
	belongs_to :user

	after_create :inform_signatories_new_reimbursement_email
	before_save :check_send_processed, if: :is_processed_changed?

	def check_send_processed
		send_processed if self.is_processed
	end

	def send_processed
	  ReimbursementMailer.delay.reimbursement_processed(self.user, self)
  end

	def inform_signatories_new_reimbursement_email
    users = User.where(bank_signatory: true)
    users.each do |user|
	    ReimbursementMailer.delay.reimbursement_created(user, self)
	  end
  end
end
