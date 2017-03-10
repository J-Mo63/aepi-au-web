class Comment < ApplicationRecord
    belongs_to :post

    def creator
        User.find(creator_id)
    end
end
