class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      oauth_email = request.env["omniauth.auth"]["email"]
      if user = User.find_by(email: oauth_email)
        session[:user_id] = user.id
        redirect_to root_path
      else
        user = User.new(email: oauth_email)
        if user.save
          session[:user_id] = user.id
          redirect_to root_path
        else
          raise user.errors.full_messages.inspect 
        end
      end
    else
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path
      else
        render "sessions/new"
      end
    end
  end

  #def create
  #  @user = User.find_by(email: params[:session][:email])
  #  if @user && @user.authenticate(params[:session][:password])
  #    session[:user_id] = @user.id
  #    redirect_to user_path(@user)
  #  else
  #    flash[:alert] = "Invalid email/password combination"
  #    redirect_to signin_path
  #  end
  #end

  #def create_facebook
  #  user = User.from_omniauth(env["omniauth.auth"])
  #  session[:user_id] = user.id
  #  redirect_to root_path
    #user = User.from_omniauth(request.env["omniauth.auth"])
    #  session[:user_id] = user.id
    #  redirect_to root_path, notice: "Successfully signed in"
  #end

  #def create_twitter
    #auth = request.env["omniauth.auth"]
    #user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    #session[:user_id] = user.id
    #redirect_to root_path, notice: "Signed in!"
  #end
  #  @user = User.from_omniauth(env["omniauth.auth"])
  #  if @user.persisted?
  #    flash[:notice] = "Signed in successfully."
  #    session[:user_id] = @user.id
  #    redirect_to root_path
  #  else
  #    failure
  #    redirect_to signin_path
  #  end
  #end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully signed out."
    redirect_to root_path
  end

  #protected

 #def auth_hash
#   request.env['omniauth.auth']
# end

  #def failure
#    render text: "Sorry, but you didn't allow access to our app!"
#  end

end
