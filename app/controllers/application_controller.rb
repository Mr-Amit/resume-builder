class ApplicationController < ActionController::Base
    include SessionsHelper
    skip_before_action :verify_authenticity_token 
    # Confirms a logged-in user.
    def logged_in_user
        unless logged_in?
          flash[:danger] = "Please log in."
          redirect_to login_url
        end
    end

end
