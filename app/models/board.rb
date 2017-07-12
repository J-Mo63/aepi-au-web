class Board < ApplicationRecord
	has_many :posts, :dependent => :destroy
	validates :colour, :hex => true
end
