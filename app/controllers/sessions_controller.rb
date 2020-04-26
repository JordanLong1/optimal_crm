class SessionsController < ApplicationController 

    def new 
        @session = Session.new 
    end

    def create 
        if @salesrep = Salesrepresentative.new 
            session[:id] = @salesrep.id 
            redirect_to Salesrepresentative_path(@salesrep)
        end
    end

    def destroy 

    end
end