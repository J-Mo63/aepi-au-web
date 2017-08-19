class Comment < ApplicationRecord
    belongs_to :post
    has_many :snaps, dependent: :destroy

    def score
	    snaps.count
	  end

    def creator
        User.find(creator_id)
    end
end
