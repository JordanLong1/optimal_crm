class OrganizationsController < ApplicationController 

    def index 
        @organizations = Organization.all 
    end

    def show 
        find_and_set_organization
    end

    def new 
        @organization = Organization.new 
    end
    
    def create 
        @organization = Organization.new(organization_params)
        @organization.save
        render :new
    end

    def show 
        @organization = Organization.find_by(id: params[:id])
    end

    private 

    def task_params
        params.require(:organization).permit(:name, :revenue, :country, :city, :state, :address)
 
    end

    def find_and_set_organization
        @organization = Organization.find_by(id: :params[:id])
    end


end