class UserMailer < ApplicationMailer

	def user_created(user)
    @user = user
    @url  = new_user_session_url
    @title = "Thanks for joining aepi.org.au, #{@user.first_name}"

    mail(to: @user.email, subject: @title)
  end

end
