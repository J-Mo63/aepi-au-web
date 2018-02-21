class Job < ApplicationRecord
	after_create :send_notifications

	def send_notifications
  	User.find_each do |user|
	    JobMailer.delay.job_created(user, self)
	  end
  end
end
