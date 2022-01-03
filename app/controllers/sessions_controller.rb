class SessionsController < ApplicationController
  def new
  
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id # create session cookie 
      flash[:notice] = "User signed in successfully"
      redirect_to user
    else
      flash.now[:alert] = "User credentials are not correct"
      # flash.now needed because we are not redirecting it but rendering.
      render 'new'
    end  
      
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "User signed out successfully"
    redirect_to root_path
  end


end