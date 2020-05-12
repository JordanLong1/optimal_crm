class ApplicationController < ActionController::Base
    # before_action :require_login


    private 

   
    def require_login
      unless !!session[:salesrepresentative_id]
        flash[:error] = "You must be logged in to access this section"
        redirect_to new_session_path
      end
    end

  
end
