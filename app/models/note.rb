class Note < ApplicationRecord
	belongs_to :contact
	belongs_to :user

	after_create :inform_rush_new_note_email

	def inform_rush_new_note_email
    users = User.where(rush_board: true)
    users.each do |user|
	    ContactMailer.delay.note_added(user, self)
	  end
  end
end
