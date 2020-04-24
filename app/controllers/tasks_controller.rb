class TasksController < ApplicationController 
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
end