class Post < ApplicationRecord
    belongs_to :board

    def creator
        User.find(creator_id)
    end
end
