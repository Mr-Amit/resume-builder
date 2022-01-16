class ProfilesController < ApplicationController
    include HomeHelper
    include ProfilesHelper
    # include SessionsHelper

    before_action :logged_in_user, only: [:update, :edit, :preview]
    before_action :correct_user,   only: [:update, :edit]
    
    
    def create
        # puts profile_params
        @profile = Profile.new(profile_params)
        if @profile.save
        else
            render 'new'
        end
    end

    def update
        updated_profile_params = update_array_attributes_in_params(profile_params)
        @profile = Profile.find(params[:id])
        if @profile.update(updated_profile_params)
            flash[:success] = "Profile updated successfully."
            
        else
            flash[:danger] = "Profile update failed."
        end
        redirect_to root_url
    end

    def correct_user
        @profile = Profile.find(params[:id])
        @user = User.find(@profile.user_id)
        redirect_to(root_url) unless @user == current_user
    end
    
    # def correct_user
    #     if current_user.id != :user_id
    #         redirect_to(root_url)
    #     end
    # end
    
    def show
        if Profile.where(id: params[:id]).empty? 
            flash[:danger] = "Profile does not exist."
            if logged_in?
                redirect_to root_url
            else
                redirect_to(login_url)
            end
        else
            @profile = Profile.find(params[:id])
        
            render :template => "shared/profile/profile_preview" , locals: { profile: @profile}
        end
    end

    def preview
        render :template => "shared/profile/profile_preview" , locals: { profile: current_user.profile}
    end

    private
        def profile_params
            params.require(:profile).permit(:name, :image, :job_title, :total_experience, :overview, 
                :career_highlights, :primary_skills, :secondary_skills,
                :educations_attributes => [ :id, :school, :degree, :description, :start, :end, :_destroy],
                :experiences_attributes => [:id, :company, :position, :start_date, :end_date, :description, :_destroy, {:projects_attributes=> %i[id title url tech_stack description _destroy]}]
            )
        end
end
