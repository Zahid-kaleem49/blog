class UsersController < ApplicationController
  before_action :set_user, only: [:destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit , :update ,:destroy]
  def new
    @user = User.new
  end

  def create
    puts 'In User_controller create method 0000000000000'
    # console

    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Welcome to alpha blog   #{@user.username} "
      session[:user_id] = @user.id
      redirect_to users_path
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
      redirect_to user_path(@user)
    else
      flash[:notice] = 'upate error'
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
    @user.inspect
  end

  def index
    @users = User.all
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    flash.notice = 'User and all his articles deleted'
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :username, :email, :password)
  end

  def require_same_user
    if current_user != @user
      flash.notice = 'You must be Owner to edit this info'
      redirect_to login_path
    end
  end
end
