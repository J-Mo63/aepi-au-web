class State < ApplicationRecord
	has_many :contacts
	validates :colour, :hex => true
end
