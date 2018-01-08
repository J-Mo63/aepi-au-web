class ReimbursementsController < ApplicationController
	before_action :authenticate_user!

  def index
    load_reimbursements
  end

  def new
    build_reimbursement
  end

  def edit
  	load_reimbursement
  end

  def create
    build_reimbursement
    save_reimbursement or render 'new'
  end

  def update
    load_reimbursement
    update_reimbursement or render 'edit'
  end

  def destroy
    load_reimbursement
    @reimbursement.destroy
    redirect_to reimbursements_path
  end

  def toggle_process
    load_reimbursement
    new_state = !@reimbursement.is_processed
    @reimbursement.update(is_processed: new_state)
    redirect_to reimbursements_path
  end

  private

  	def load_reimbursements
  		@unprocessed_reimbursements = policy_scope(Reimbursement).order(created_at: :desc).where(is_processed: false)
  		@processed_reimbursements = policy_scope(Reimbursement).order(created_at: :desc).where(is_processed: true)
  	end

  	def load_reimbursement
  		@reimbursement = Reimbursement.find(params[:id])
    	authorize @reimbursement
  	end

  	def build_reimbursement
			@reimbursement = Reimbursement.new(reimbursement_params)
      authorize @reimbursement
		end

		def save_reimbursement
			if @reimbursement.save
				redirect_to reimbursements_path
			end
		end

		def update_reimbursement
	    if @reimbursement.update(reimbursement_params)
				redirect_to reimbursements_path
			end
		end

		def reimbursement_params
    	reimbursement_params = params[:reimbursement]
    	reimbursement_params ? reimbursement_params.permit(:user_id, :title, :description, :bsb, :account_number, :account_name, :is_processed, :image, :total_value) : {}
    end
end
