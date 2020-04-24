class LeadsController < ApplicationController 

    def index 
        @teads = Lead.all 
    end

    def show 
        find_and_set_lead
    end

    def new 
        @lead = Lead.new 
    end
    
    def create 
        @lead = Lead.new(lead_params)
        @lead.save
        render :new
    end

    def show 
        @lead = Lead.find_by(id: params[:id])
    end

    private 

    def task_params
        params.require(:lead).permit(:name, :email, :phone_number, :customer)
 
    end

    def find_and_set_lead
        @lead = Lead.find_by(id: :params[:id])
    end


end