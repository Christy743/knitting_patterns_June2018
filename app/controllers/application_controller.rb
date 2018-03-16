class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  before_action :current_user
  before_action :require_logged_in, except: [:new, :create, :welcome]

  def welcome
  end

  def authenticate
    redirect_to signin_path unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  private

  def require_logged_in
    redirect_to root_path unless logged_in?
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        @current_user = user
      end
    end
  end
  helper_method :current_user

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

end
