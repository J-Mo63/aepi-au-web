class Contact < ApplicationRecord
	
	def full_name
		"#{first_name} #{last_name}"
	end

	def self.search(search)
	  if search
	  	search = search.downcase
	  	self.where("lower(first_name) LIKE ? OR lower(last_name) LIKE ? OR lower(uni) LIKE ?", "%#{search}%","%#{search}%","%#{search}%")
	  else
	    self.all
	  end
	end
end
