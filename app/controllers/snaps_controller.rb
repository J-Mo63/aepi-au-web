class SnapsController < ApplicationController

  def create
    @snap = Snap.new(snap_params)
    if @snap.save
      redirect_to post_path(@snap.comment.post)
    end
  end

  def destroy
  	@snap = Snap.find(params[:id])
  	post = @snap.comment.post
    authorize @snap
    @snap.destroy
    redirect_to post_path(post)
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def snap_params
      params.require(:snap).permit(:user_id, :comment_id)
    end
end
