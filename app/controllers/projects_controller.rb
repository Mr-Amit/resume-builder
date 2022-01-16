class ProjectsController < ApplicationController
  before_action :logged_in_user, only: [:new]

  def new
    id = params[:format]
    project = Project.create(experience_id: id)
    if project.valid?
      flash[:success] = "Project added."
      redirect_to edit_url
    else
      flash[:danger] = 'Failed to add projects'
      redirect_to root_url
    end
  end

  def update
    params_with_projects = project_params
    @project = Project.find_by(experience_id: params[:id])
    if @project.update(params_with_projects)
      flash[:success] = 'Projects added successfully.'
      redirect_to edit_url
    else
      flash[:danger] = 'Failed to add projects! Try again!'
      redirect_to root_url
    end
  end

  # def project_params
  #   params.require(:project).permit(:title, :url, :tech_stack, :description,experiences_attributes: %i[id _destroy])
  # end
  
  def destroy
    project.destroy
  end
end