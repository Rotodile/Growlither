class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :get_requests, if: -> { current_user }
  
    private

  
    def get_requests
      @requests = current_user.requests_received.includes(:sender)
    end
end
