class UsersController < ApplicationController
  def signup
    @user = User.new
  end

  def create
    puts 'In User_controller create method 0000000000000'
    # debugger
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to alpha blog   #{@user.username} "
      redirect_to user_show_path
    else
        flash[:notice] = "sign up error"
        render 'signup'
    end
end
    def show; 
    end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
