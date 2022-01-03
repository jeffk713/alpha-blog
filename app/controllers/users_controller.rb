class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_themselves, only: [:edit, :update, :destory]
  
  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Hi #{@user.username}, your account has been created successfully"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 4)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account has been updated successfully"
      redirect_to @user
    else
      render 'edit'
    end  
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "The account has been deleted successfully"
    redirect_to root_path
  end
  

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
  
  def require_themselves
    if current_user != @user
      flash[:notice] = "Access is denied"
      redirect_to @user
    end
  end
  

end