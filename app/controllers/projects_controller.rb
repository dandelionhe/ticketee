class ProjectsController < ApplicationController
	before_action :set_project,only:[:show]
	
	def index

	end

	def new
	  @project = Project.new
	end

	def create
	  @project = Project.new(project_params)
		if @project.save
			flash[:success] = 'Project has been created.'
			redirect_to @project
		else
			flash[:danger] = 'Project can not be created.'
			render 'new'
		end
	end

	def show

	end

	private
	def project_params
	  params.require(:project).permit(:name,:description)
	end

	def set_project
	  @project = Project.find(params[:id])
	end

end
