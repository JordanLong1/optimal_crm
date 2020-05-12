class LeadsController < ApplicationController 

    before_action :require_login
    before_action :has_authorization, only: [:edit, :destroy]
    
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

        if salesrep && salesrep == helpers.current_user
            @lead = salesrep.leads.build
        else
              redirect_to root_path, alert: "You are not authorized to add a new lead for this account."
        end
    end

    def edit 
        
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
        @lead.destroy 
        redirect_to lead_path(@lead)
    
    end
 

    private 

    def has_authorization
        find_and_set_lead
        redirect_to salesrepresentative_path(helpers.current_user), alert: "You don't have access to this" unless helpers.current_user == @lead.salesrepresentative 
    end

    def lead_params
        params.require(:lead).permit(:name, :email, :phone_number, :customer, :salesrepresentative_id, :organization_id)
 
    end

    def find_and_set_lead
        @lead = Lead.find_by(id: params[:id])
    end


end