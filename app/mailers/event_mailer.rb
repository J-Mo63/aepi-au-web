class EventMailer < ApplicationMailer

	def event_created(user, event)
    @user = user
    @event = event
    @requesting_user = @event.user
    @url  = event_url(@event.id)
    @title = "#{@requesting_user.full_name} has submitted an event proposal for review"

    mail(to: @user.email, subject: @title)
  end

  def event_processed(user, event)
    @user = user
    @event = event
    @url  = event_url(@event.id)
    @title = "Your proposal for #{@event.title} has been approved!"

    mail(to: @user.email, subject: @title)
  end

end