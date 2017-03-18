class JobsController < ApplicationController

  def index
    @jobs = policy_scope(Job)
  end

  def show
  end

  def new
    @job = Job.new
    authorize @job
  end

  def edit
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
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def job_params
      params.require(:job).permit(:title, :description)
    end
end
