class Contact < ApplicationRecord

	belongs_to :uni, optional: true
	belongs_to :state, optional: true
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :email, :email => true
	has_many :notes
	has_one :user, foreign_key: 'added_by'
	
	def full_name
		"#{first_name} #{last_name}"
	end

	def self.search(search)
	  if search && search != ""
	  	search = search.downcase

	  	result = []

	  	result << where("LOWER(first_name) 	LIKE ?", "%#{search}%")
	  	result << where("LOWER(last_name) 	LIKE ?", "%#{search}%")
	  	result << joins(:uni).where("LOWER(unis.name) LIKE ?", "%#{search}%")
	  	result << joins(:state).where("LOWER(states.name) 	LIKE ?", "%#{search}%")

	  	result.flatten.uniq
	  else
	    self.all
	  end
	end
end
