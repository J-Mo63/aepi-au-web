class UsersController < ApplicationController

  def index
    @users = policy_scope(User)
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    authorize @user

    if @user.update(user_params)
      redirect_to users_path
    else
      redirect_to users_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:admin, :rush_board, :email, :username, :first_name, :last_name)
    end

end