class SessionsController < ApplicationController
  
  before_filter :authenticate_user, :only => [:home, :profile, :setting]
  before_filter :save_login_state, :only => [:login, :login_attempt]
  
  def login
    
    
    
  end

  def home
  end

  def profile
  end

  def setting
  end



  def login_attempt
    auth_user = Handler.authenticate(params[:email],params[:password])
    if auth_user
      session[:user_id] = auth_user.id
      flash[:notice] = "Welcome back #{auth_user.first_name}"
      redirect_to(:action => 'home')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"  
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'  
  end


end