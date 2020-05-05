class SessionsController < ApplicationController 

    def new 
        @salesrep = Salesrepresentative.new 
    end

    def create 
        @salesrep = Salesrepresentative.find_by(email: params[:salesrepresentative][:email])
        if @salesrep && @salesrep.authenticate(params[:salesrepresentative][:password])
            session[:salesrepresentative_id] = @salesrep.id 
            redirect_to salesrepresentative_path(@salesrep)
        else 
            redirect_to new_session_path, alert: "Couldn't find a user. Please try again"
        end 
            # FOR ELSE redirect_to new_session_path, alert: "User not found. Please try again."

    end

    def destroy 
        session.delete :session_id
        redirect_to root_path
    end
end