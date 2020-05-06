class LeadsController < ApplicationController 

    def index 
        if params[:salesrepresentative_id].present?
            @salesrep = Salesrepresentative.find_by(id: params[:salesrepresentative_id])
            @leads = @salesrep.leads
        else
        @leads = Lead.all 
        end
    end

    def show 
        find_and_set_lead
    end

    def new 
        salesrep = Salesrepresentative.find_by(id: params[:salesrepresentative_id]) 
        if salesrep
            @lead = salesrep.leads.build
        else
              redirect_to root_path # flash an alert?
        end
    end

    def edit 
        find_and_set_lead
    end
    
    def create 
        @lead = Lead.new(lead_params)
        if @lead.save
            redirect_to lead_path(@lead) 
        else 
            render 'new'
        end
    end

    def update 
        find_and_set_lead
       if @lead.update(lead_params)
        redirect_to lead_path(@lead)
       else 
        render 'edit'
       end
    end

    def destroy 
        find_and_set_lead
    end
 

    private 

    def lead_params
        params.require(:lead).permit(:name, :email, :phone_number, :customer, :salesrepresentative_id, :organization_id)
 
    end

    def find_and_set_lead
        @lead = Lead.find_by(id: params[:id])
    end


end