class OrganizationsController < ApplicationController 

    before_action :require_login
    before_action :is_authorized, only: [:edit, :destroy]

    def index 
        @organizations = Organization.all 
    end

    def show 
        find_and_set_organization
    end

    def new 
        # binding.pry
        @organization = Organization.new 
    end

    def edit
        
    end
    
    def create 
        @organization = Organization.new(organization_params)
       if @organization.save
        redirect_to organization_path(@organization)
       else  
        render 'new'
       end
    end

    def update 
        if @organization.update(organization_params)
        redirect_to organization_path(@organization)
        else  
            render 'edit'
        end

    end

    def destroy
        @organization.destroy 
        redirect_to new_organization_path(@organization)
    end


    private 

    def is_authorized
        find_and_set_organization
        # binding.pry
        redirect_to salesrepresentative_path(helpers.current_user), alert: "You don't have access to change this information." unless @organization.salesrepresentatives.find_by(id: helpers.current_user.id)
    end

    def organization_params
        params.require(:organization).permit(:name, :revenue, :country, :city, :state, :address)
 
    end

    def find_and_set_organization
        @organization = Organization.find_by(id: params[:id])
    end


end