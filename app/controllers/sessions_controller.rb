class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if params[:email].present? && params[:password].present?
      user = User.find_by(:email => params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        remember user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to root_path
      else
        flash.now[:notice] = "Could not find that person, sorry!"
        render :new
      end
    else request.env["omniauth.auth"].present?
      user = User.find_or_create_by_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_to root_path
    end
  end

  def destroy
    forget(current_user)
    session[:user_id] = nil
    flash[:notice] = "You have successfully signed out."
    redirect_to root_path
  end

  def failure
    render text: "Sorry, but you didn't allow access to our app!"
  end

end
