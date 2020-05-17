class SalesrepresentativesController < ApplicationController 

    before_action :require_login, only: [:index, :show]

    def index 
        @salesreps = Salesrepresentative.all
    end

    def show 
        @salesrep = Salesrepresentative.find_by(id: params[:id])
    end
   
    def new 
        @salesrep = Salesrepresentative.new 
    end
    
    def create 
        
        @salesrep = Salesrepresentative.new(salesrepresentative_params)
       if @salesrep.save
        session[:salesrepresentative_id] = @salesrep.id
        redirect_to salesrepresentative_path(@salesrep)
       else  
        render 'new'
       end
    end


    private 

    def salesrepresentative_params
        params.require(:salesrepresentative).permit(:name, :email, :password, :password_confirmation)
 
    end
end