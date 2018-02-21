class UserMailer < ApplicationMailer

	def user_created(user)
    @user = user
    @url  = new_user_session_url
    @title = "Thanks for joining aepi.org.au, #{@user.first_name}"

    mail(to: @user.email, subject: @title)
  end

  def user_created_admin_notification(user, new_user)
    @user = user
    @new_user = new_user
    @url  = users_url
    @title = "#{@new_user.full_name} has joined aepi.org.au"

    mail(to: @user.email, subject: @title)
  end

end
