class Post < ApplicationRecord
    belongs_to :board

    has_many :comments, :dependent => :destroy

    def creator
        User.find(creator_id)
    end
end
