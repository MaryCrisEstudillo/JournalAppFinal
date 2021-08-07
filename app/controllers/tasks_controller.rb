class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.create(task_params)
        if @task.save
            redirect_to @task
        else
            render :new
        end
    end

    def show
        @task = Task.find(params[:id])
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        @task.update!(task_params)
        redirect_to @task
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to @task
      end

private

    def task_params
        params.require(:task).permit(:title, :body)
    end

end