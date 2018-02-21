class BlogPost < ApplicationRecord

	before_save :check_send_newsletter, if: :is_published_changed?

	def check_send_newsletter
		send_newsletter if self.is_published
	end

	def send_newsletter
    users = User.all
    users.each do |user|
	    BlogPostMailer.delay.blog_post_created(user, self)
  end
end