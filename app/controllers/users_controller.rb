class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @patterns = @user.patterns
    #@patterns = Pattern.all
    @favorite_patterns = FavoritePattern.all

    render :layout => false

    respond_to do |format|
     format.html {render :index}
     format.json {render json: @patterns}
    end
  end

  def show
    @user = User.find(params[:id])
    @patterns = @user.patterns
    @user.favorites = current_user.favorites

    respond_to do |format|
      format.html
      format.json {render json: @pattern}
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome! You have successfully made a new profile!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to @user, notice: "Your profile was successfully updated."
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username, :id, :email,
                                 :password, :password_confirmation,
                                 :bio, favorite_pattern_ids: [],
                                  favorite_patterns_attributes:
                                [:user_id, :pattern_id, :my_favorite])
  end

end
