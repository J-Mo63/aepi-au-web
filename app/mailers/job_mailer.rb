class JobMailer < ApplicationMailer

	def job_created(user, job)
    @user = user
    @job = job
    @url  = jobs_url
    @title = "New job open: #{@job.title}"

    mail(to: @user.email, subject: @title)
  end

end
