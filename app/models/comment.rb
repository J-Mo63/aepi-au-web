class Comment < ApplicationRecord
    belongs_to :post

    def creator
        User.find(creator_id)
    end

    after_create :notify_subscribed_email

		def notify_subscribed_email
	    users = get_users
	    users.each do |user|
		    CommentMailer.delay.comment_created(user, self)
		  end
	  end

	  def get_users
	  	comments = Comment.where(post_id: self.post.id)
	  	users = Array.new

	  	comments.each do |comment|
	  		users << comment.creator
	  	end

	  	users << post.creator

			users.uniq
	  	users.delete(self.creator)

	  	return users.uniq
	  end
end
