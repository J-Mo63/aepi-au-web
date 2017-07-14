class Contact < ApplicationRecord

	belongs_to :uni, optional: true
	belongs_to :state, optional: true
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	has_many :notes
	
	def full_name
		"#{first_name} #{last_name}"
	end

	def self.search(search)
	  if search && search != ""
	  	search = search.downcase
	  	joins(:uni).joins(:state).where("lower(first_name) LIKE ? OR lower(last_name) LIKE ? OR lower(unis.name) LIKE ? OR lower(states.name) LIKE ?", "%#{search}%","%#{search}%","%#{search}%","%#{search}%")
	  else
	    self.all
	  end
	end
end
