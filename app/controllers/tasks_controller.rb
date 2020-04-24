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
    
    def create 
        @task = Task.new(task_params)
        @task.save
        render :new
    end

    def show 
        @task = Task.find_by(id: params[:id])
    end

    private 

    def task_params
        params.require(:task).permit(:title, :content, :complete)
 
    end

    def find_and_set_task
        @task = Task.find_by(id :params[:id])
    end


end