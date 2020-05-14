class TasksController < ApplicationController 
    before_action :require_login
    before_action :has_authorization, only: [:edit, :destroy]


    def index 
        @tasks = Task.all 
    end

    def show 
        find_and_set_task
    end

    def new 
        salesrep = Salesrepresentative.find_by(id: params[:salesrepresentative_id]) 
        if salesrep && salesrep == helpers.current_user
            @task = salesrep.tasks.build
        else
              redirect_to root_path, alert: "You are not authorized to add a new lead for this account."
        end
    end

    def edit 
        
    end
    
    def create 
        @task = Task.new(task_params)
       if @task.save
        redirect_to task_path(@task)
       else 
        render 'new'
       end
    end

    def update 
        
       if @task = Task.update(task_params)
        redirect_to task_path(@task)
       else 
        render 'edit'
       end
    end

    def destroy 
        @task.destroy 
        redirect_to salesrepresentative_path(helpers.current_user)
    end



    private 

    def has_authorization
        find_and_set_task
        redirect_to salesrepresentative_path(helpers.current_user), alert: "You don't have access to this." unless helpers.current_user == @task.salesrepresentative
    end

    def task_params
        params.require(:task).permit(:title, :content, :complete, :salesrepresentative_id)
 
    end

    def find_and_set_task
        @task = Task.find_by(id: params[:id])
    end


end