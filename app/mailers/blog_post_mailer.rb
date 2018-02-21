class BlogPostMailer < ApplicationMailer
	include ActionView::Helpers::TextHelper

	def blog_post_created(user, blog_post)
    @user = user
    @blog_post = blog_post
    @formatted_body = simple_format(Rinku.auto_link(@blog_post.body))

    mail(to: @user.email, subject: @blog_post.title)
  end

end