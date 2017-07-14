class RegistrationsController < Devise::RegistrationsController
	before_action :authenticate, only: [:create, :new]

  def create
    super
  end

  def new
    super
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "sheldon" && password == "creamypastarenegademaster"
    end
  end

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
  end
end
