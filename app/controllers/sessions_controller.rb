class SessionsController < ApplicationController 

    def new 
        @salesrep = Salesrepresentative.new 
    end

    def create 
        @salesrep = Salesrepresentative.find_by(email: params[:Salesrepresentative][:email])
            session[:id] = @salesrep.id 
            redirect_to salesrepresentative_path(@salesrep)
    end

    def destroy 
        session.delete :session_id
        redirect_to root_path
    end
end