class Contact < ApplicationRecord

	belongs_to :uni, optional: true
	belongs_to :state
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	
	def full_name
		"#{first_name} #{last_name}"
	end

	def self.search(search)
	  if search
	  	search = search.downcase
	  	joins(:uni).where("lower(first_name) LIKE ? OR lower(last_name) LIKE ? OR lower(unis.name) LIKE ?", "%#{search}%","%#{search}%","%#{search}%")
	  else
	    self.all
	  end
	end
end
