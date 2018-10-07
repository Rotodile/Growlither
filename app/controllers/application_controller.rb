class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :get_requests, if: -> { current_user }
  
    private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
  
    def get_requests
      @requests = current_user.requests_received.includes(:sender)
    end
end
