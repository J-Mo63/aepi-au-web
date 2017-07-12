class Board < ApplicationRecord
	has_many :posts, :dependent => :destroy
end
