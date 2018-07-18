class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update]
  before_action :correct_user, only: [ :edit, :update]

  def show
    @user = User.find(params[:id])
    @todos = @user.todos.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page])
    #if logged_in?
    #  flash[:success] = "logged in"
    #end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "thanks for signing up!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
