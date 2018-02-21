class ReimbursementMailer < ApplicationMailer

	def reimbursement_created(user, reimbursement)
    @user = user
    @reimbursement = reimbursement
    @requesting_user = @reimbursement.user
    @url  = reimbursements_url
    @title = "#{@requesting_user.full_name} has submitted a receipt for review"

    mail(to: @user.email, subject: @title)
  end

  def reimbursement_processed(user, reimbursement)
    @user = user
    @reimbursement = reimbursement
    @url  = reimbursements_url
    @title = "Your request for #{@reimbursement.title} has been processed!"

    mail(to: @user.email, subject: @title)
  end

end