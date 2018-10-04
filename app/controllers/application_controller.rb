class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    private
  
    def get_requests
      @requests = current_user.requests_received.includes(:sender)
    end
end
