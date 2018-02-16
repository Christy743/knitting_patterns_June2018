class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "Invalid email/password combination"
      redirect_to signin_path
    end
  end

  #def create_facebook
  #  user = User.from_omniauth(env["omniauth.auth"])
  #  session[:user_id] = user.id
  #  redirect_to root_path
    #user = User.from_omniauth(request.env["omniauth.auth"])
    #  session[:user_id] = user.id
    #  redirect_to root_path, notice: "Successfully signed in"
  #end

  def create_twitter
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_path, notice: "Signed in!"
  end
    #@user = User.find_or_create_from_auth_hash(auth_hash)
    #self.current_user = @user
    #redirect_to root_path

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully signed out."
    redirect_to root_path
  end

  protected

 def auth_hash
   request.env['omniauth.auth']
 end

end
