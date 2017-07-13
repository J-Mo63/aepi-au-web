class StatesController < ApplicationController
  before_action :set_state, only: [:show, :edit, :update, :destroy]

  def new
    @state = State.new
  end

  def create
    @state = State.new(state_params)

    if @state.save
      redirect_to contacts_settings_path
    else
      render :action => 'new'
    end
  end

  def destroy
    @state.destroy
    redirect_to contacts_settings_path
  end

  def edit
    @state = State.find(params[:id])
  end

  def update
    @state = State.find(params[:id])

    if @state.update(state_params)
      redirect_to contacts_settings_path
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def state_params
      params.require(:state).permit(:name, :colour)
    end
end
