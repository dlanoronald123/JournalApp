class TasksController < ApplicationController
   
    include Devise::Controllers::Helpers 
    before_action :authenticate_user!
    before_action :get_category 

    def index
        @tasks = @category.tasks.all
    end

    def new
        @task = @category.tasks.build
    end

    def create 
        @task = @category.tasks.build(task_params)
        if @task.valid?
        @task.save
        redirect_to category_tasks_path(@category)
        flash[:notice] = "New task has been successfully added"
        else 
            render :new
        end
    end

    def show
        @task = @category.tasks.find(params[:id])
    end

    def edit
        @task = @category.tasks.find(params[:id])
    end

    def update
        @task = @category.tasks.find(params[:id])

        if @task.update(task_params)
            @task.save
            redirect_to category_task_path(@category, @task)
            flash[:notice] = "Task has been successfully updated"
        else
            render :edit
        end
    end

    def destroy
        @task = @category.tasks.find(params[:id])
        @task.destroy
        flash[:alert] = "Task has been successfully deleted"
        redirect_to category_tasks_path(@category)
    end

    private 

    def get_category
        @category = Category.find(params[:category_id])
    end

    def task_params
        params.require(:task).permit(:name, :description, :deadline, :category_id, :done)
    end
end
