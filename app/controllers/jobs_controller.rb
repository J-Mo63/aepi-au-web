class JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    load_jobs
  end

  def new
    build_job
  end

  def edit
    load_job
  end

  def create
    build_job
    save_job or render 'new'
  end

  def update
    load_job
    update_job or render 'edit'
  end

  def destroy
    load_job
    @job.destroy
    redirect_to jobs_path
  end

  private

  	def load_jobs
  		@jobs = policy_scope(Job).order(created_at: :desc)
  	end

  	def load_job
  		@job = Job.find(params[:id])
    	authorize @job
  	end

  	def build_job
			@job = Job.new(job_params)
      authorize @job
		end

		def save_job
			if @job.save
				redirect_to jobs_path
			end
		end

		def update_job
	    if @job.update(job_params)
				redirect_to jobs_path
			end
		end

    def job_params
    	job_params = params[:job]
    	job_params ? job_params.permit(:title, :description, :is_expired) : {}
    end
end
