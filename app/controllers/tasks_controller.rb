class TasksController < ApplicationController
	before_action :authenticate_user!
	before_action :set_task, only: [:edit, :update, :destroy]
	
	def create
		@task = Task.new(task_params)
		if @task.save
			redirect_to @task, success: 'Task created'
		else 
			flash.now[:danger] = 'Not done'
			render :new
		end
	end

	def new
		@task = Task.new
	end

	def edit
	end

	def show
		redirect_to projects_path
	end

	def update
		if @task.update_attributes(task_params)
			redirect_to @task, success: 'Updated'
		else 
			flash.now[:danger] = 'Not done'
			render :edit
		end		
	end

	def destroy
		@task.destroy 
		redirect_to projects_path, success: 'Deleted successfully'
	end
	# приватный метод для фильтрации параметров
	private def task_params
		params.require(:task).permit(:title, :description, :status, :project_id, :user_id)
	end

	private def set_task
		@task = Task.find(params[:id])
	end

end
