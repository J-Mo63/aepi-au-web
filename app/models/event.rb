class Event < ApplicationRecord
	belongs_to :user

	after_create :inform_signatories_new_event_email
	before_save :check_send_approved, if: :is_approved_changed?

	def check_send_approved
		send_approved if self.is_approved
	end

	def send_approved
	  EventMailer.delay.event_processed(self.user, self)
  end

	def inform_signatories_new_event_email
    users = User.where(bank_signatory: true)
    users.each do |user|
	    EventMailer.delay.event_created(user, self)
	  end
  end
end