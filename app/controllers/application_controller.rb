class ApplicationController < ActionController::Base

    def logged_in?
        !!session[:salesrepresentative_id]

    end

  
end
