class JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @jobs = policy_scope(Job)
    @jobs = @jobs.order(created_at: :desc)
  end

  def show
  end

  def new
    @job = Job.new
    authorize @job
  end

  def edit
    @job = Job.find(params[:id])
    authorize @job
  end

  def create
        @job = Job.new(job_params)
        authorize @job

        if @job.save
            redirect_to :action => 'index'
        else
            render :action => 'new'
        end
    end

  def update
    @job = Job.find(params[:id])
    authorize @job

    if @job.update(job_params)
      redirect_to jobs_url
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    authorize @job
    @job.destroy
    redirect_to jobs_url
  end

  private

    def job_params
      params.require(:job).permit(:title, :description, :is_expired)
    end
end
