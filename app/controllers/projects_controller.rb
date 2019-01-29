class ProjectsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show] 
	before_action :set_project, only: [:show, :edit, :update, :destroy]

	def index
		@projects = Project.all
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to @project, success: 'Project created'
		else 
			flash.now[:danger] = 'Not done'
			render :new
		end
	end

	def show
	end

	def new
		@project = Project.new
	end

	def edit
	end

	def update
		if @project.update_attributes(project_params)
			redirect_to @project, success: 'Updated'
		else 
			flash.now[:danger] = 'Not done'
			render :edit
		end		
	end

	def destroy
		@project.destroy 
		redirect_to projects_path, success: 'Deleted successfully'
	end
	# приватный метод для фильтрации параметров
	private def project_params
		params.require(:project).permit(:name, :summary, :start_date, :end_date)
	end

	private def set_project
		@project = Project.find(params[:id])
	end

end
