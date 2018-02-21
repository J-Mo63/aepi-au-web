class CommentMailer < ApplicationMailer

	def comment_created(user, comment)
    @user = user
    @comment = comment
    @post = @comment.post
    @url  = post_url(@post.id)
    @title = "New comment on: #{@post.title}"

    mail(to: @user.email, subject: @title)
  end

end
