module ApplicationHelper
    def current_user 
        @current_user ||= Salesrepresentative.find_by(id: session[:salesrepresentative_id]) if session[:salesrepresentative_id]
    end
end
