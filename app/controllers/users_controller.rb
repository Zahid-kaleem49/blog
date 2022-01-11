class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    puts 'In User_controller create method 0000000000000'
    # debugger
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to alpha blog   #{@user.username} "
      render 'new'
    else
      flash[:notice] = 'sign up error'
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'User data updated'
      redirect_to articles_new_path
    else
      flash[:notice] = 'upate error'
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @user = @user.articles
    @user.inspect
    
  end

  def user_params
    params.require(:user).permit(:id, :username, :email, :password)
  end
end
