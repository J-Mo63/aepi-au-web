class UnisController < ApplicationController
  before_action :set_uni, only: [:show, :edit, :update, :destroy]

  def new
    @uni = Uni.new
  end

  def create
    @uni = Uni.new(uni_params)

    if @uni.save
      redirect_to contacts_settings_path
    else
      render :action => 'new'
    end
  end

  def destroy
    @uni.destroy
    redirect_to contacts_settings_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uni
      @uni = Uni.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uni_params
      params.require(:uni).permit(:name, :city)
    end
end
