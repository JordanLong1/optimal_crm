class LeadsController < ApplicationController 

    def index 
        @leads = Lead.all 
    end

    def show 
        find_and_set_lead
    end

    def new 
        @lead = Lead.new 
    end

    def edit 

    end
    
    def create 
        @lead = Lead.new(lead_params)
        @lead.save
        redirect_to lead_path(@lead)
    end

    def update 

    end

    def destroy 

    end
 

    private 

    def lead_params
        params.require(:lead).permit(:name, :email, :phone_number, :customer)
 
    end

    def find_and_set_lead
        @lead = Lead.find_by(id: :params[:id])
    end


end