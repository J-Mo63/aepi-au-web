class ApplicationController < ActionController::Base
    protect_from_forgery
    include Pundit
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate if false
    after_action :verify_policy_scoped, only: :index

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def authenticate
        authenticate_or_request_with_http_basic do |username, password|
            username == "ben_ezzes" && password == "creamypastarenegademaster"
        end
    end

    def user_not_authorized
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to(request.referrer || root_path)
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
end
