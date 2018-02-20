class JobMailer < ApplicationMailer

	def job_created(user, job)
    @user = user
    @job = job
    @url  = jobs_url
    @title = 'A new job has been opened on aepi.org.au'

    mail(to: @user.email, subject: @title)
  end

end
