class ContactMailer < ApplicationMailer

	def contact_created(user, contact)
    @user = user
    @contact = contact
    @url  = contact_url(contact.id)
    @title = "Contact added: #{@contact.full_name}"

    mail(to: @user.email, subject: @title)
  end

  def contact_updated(user, contact)
    @user = user
    @contact = contact
    @url  = contact_url(contact.id)
    @title = "Contact updated: #{@contact.full_name}"

    mail(to: @user.email, subject: @title)
  end

  def note_added(user, note)
    @user = user
    @note = note
    @creator = note.user
    @contact = @note.contact
    @url  = contact_url(@contact.id)
    @title = "#{@creator.full_name} has added a note about #{@contact.full_name}"

    mail(to: @user.email, subject: @title)
  end

end