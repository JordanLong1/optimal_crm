class TasksController < ApplicationController 

    def index 
        @tasks = Task.all 
    end

    def show 
        find_and_set_task
    end

    def new 
        @task = Salesrepresentative.new 
    end

    def edit 
        find_and_set_task
    end
    
    def create 
        @task = Task.new(task_params)
        @task.save
        render :new
    end

    def update 
        find_and_set_task
        @task = Task.update(task_params)
        redirect_to task_path(@task)
    end

    def destroy 

    end



    private 

    def task_params
        params.require(:task).permit(:title, :content, :complete)
 
    end

    def find_and_set_task
        @task = Task.find_by(id: :params[:id])
    end


end