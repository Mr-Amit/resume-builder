class EducationsController < ApplicationController
    before_action :logged_in_user, only: [:new]

    def new
        current_user.profile.educations.create
        flash[:success] = "Education added."
        redirect_to edit_url
    end
    
    def destroy
        education.destroy
    end
end
