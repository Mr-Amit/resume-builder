class ExperiencesController < ApplicationController
  before_action :logged_in_user, only: [:new]

  def new
    current_user.profile.experiences.create
    flash[:success] = "Experience added."
    redirect_to edit_url
  end

  def update
    params_with_projects = experience_params
    @experience = Experience.find(params[:id])
    if @experience.update(params_with_projects)
      flash[:success] = 'Experience with projects added successfully'
      redirect_to edit_url
    else
      flash[:danger] = 'Failed to add experiences with projects'
      redirect_to root_url
    end
  end

  # def experience_params
  #   params.require(:profile).permit(:company, :position, :start_date, :end_date, :description,
  #                                   projects_attributes: %i[id title url tech_stack description _destroy])
  # end
  def destroy
    experience.destroy
  end
end