class SalesrepresentativesController < ApplicationController 

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
        @salesrep.save
        render :new
    end


    private 

    def salesrepresentative_params
        params.require(:salesrepresentative).permit(:name, :email, :password_digest)
 
    end
end