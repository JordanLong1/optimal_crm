class LeadsController < ApplicationController 

    def index 
        @leads = Lead.all 
    end

    def show 
        find_and_set_lead
    end

    def new 
        @lead = Lead.new(salesrepresentative_id: params[:salesrepresentative_id])
    end

    def edit 
        find_and_set_lead
    end
    
    def create 
        @lead = Lead.new(lead_params)
        @lead.save
        redirect_to lead_path(@lead)

    
    end

    def update 
        find_and_set_lead
        @lead.update(name: params[:lead][:name], email: params[:lead][:email], phone_number: params[:lead][:phone_number], customer: params[:lead][:customer])
        redirect_to lead_path(@lead)
    end

    def destroy 
        find_and_set_lead
    end
 

    private 

    def lead_params
        params.require(:lead).permit(:name, :email, :phone_number, :customer, :salesrepresentative_id)
 
    end

    def find_and_set_lead
        @lead = Lead.find_by(id: params[:id])
    end


end