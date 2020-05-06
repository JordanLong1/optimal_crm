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

    def edit
        find_and_set_organization

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
        find_and_set_organization
        if @organization.update(organization_params)
        redirect_to organization_path(@organization)
        else  
            render 'edit'
        end

    end

    def destroy
        find_and_set_organization
        @organization.destroy 
        redirect_to new_organization_path(@organization)
    end


    private 

    def organization_params
        params.require(:organization).permit(:name, :revenue, :country, :city, :state, :address)
 
    end

    def find_and_set_organization
        @organization = Organization.find_by(id: params[:id])
    end


end