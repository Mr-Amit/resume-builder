class UsersController < ApplicationController
  def new
  	   @user = User.new
  end

  def show
  	    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)    
    if @user.save
      Profile.create(user: @user)
      log_in(@user)
      redirect_to(root_path)
    else
      render 'new'
    end
	end

 def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end