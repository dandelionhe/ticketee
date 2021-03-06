class ProjectsController < ApplicationController
	before_action :set_project,only:[:show,:edit,:update,:destroy]

	def index
		@projects = Project.all
	end

	def show
		authorize @project, :show?
	end

	def edit

	end

	def update
		if @project.update(project_params)
			flash[:success] = 'Project has been updated.'
			redirect_to @project
		else
			flash[:danger] = 'Project has not been updated.'
			render 'edit'
		end
	end


	private
	def project_params
	  params.require(:project).permit(:name,:description)
	end

	def set_project
	  @project = Project.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert]='The project you were looking for could not be found.'
		redirect_to projects_path
	end

end
