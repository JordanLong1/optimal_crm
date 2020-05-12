require 'securerandom'
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

    end

    def omniauth
        @salesrep = Salesrepresentative.find_or_create_by(email: auth[:info][:email]) do |u|
            u.uid = auth['uid']
            u.name = auth['info']['name']
            u.password = SecureRandom.alphanumeric(10)
          end
       
          session[:salesrepresentative_id] = @salesrep.id
       
          redirect_to salesrepresentative_path(@salesrep)
    end

    def destroy 
        session.delete :salesrepresentative_id
        redirect_to root_path
    end

    private
 
  def auth
    request.env['omniauth.auth']
  end
end