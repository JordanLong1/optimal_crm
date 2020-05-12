class TasksController < ApplicationController 
    before_action :require_login


    def index 
        @tasks = Task.all 
    end

    def show 
        find_and_set_task
    end

    def new 
        salesrep = Salesrepresentative.find_by(id: params[:salesrepresentative_id]) 
        if salesrep
            @task = salesrep.tasks.build
        else
              redirect_to root_path # flash an alert?
        end
    end

    def edit 
        find_and_set_task
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
        find_and_set_task
       if @task = Task.update(task_params)
        redirect_to task_path(@task)
       else 
        render 'edit'
       end
    end

    def destroy 
        find_and_set_task 
        @task.destroy 
        redirect_to task_path(@task)
    end



    private 

    def task_params
        params.require(:task).permit(:title, :content, :complete, :salesrepresentative_id)
 
    end

    def find_and_set_task
        @task = Task.find_by(id: params[:id])
    end


end