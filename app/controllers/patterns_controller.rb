class PatternsController < ApplicationController

  def index
    @patterns = Pattern.all
    #binding.pry
  end

  def show
    @pattern = Pattern.find(params[:id])
    @comment = Comment.new
  end

  def new
    @pattern = Pattern.new
    @pattern = current_user.patterns.build
    @user = current_user
  end

  def create
    @pattern = current_user.patterns.build(pattern_params)
    #binding.pry
    if @pattern.save
      redirect_to pattern_path(@pattern), notice: "You have successfully made a pattern!"
    else
      render :new
    end
  end

  def edit
    @pattern = Pattern.find(params[:id])
  end

  def update
    @pattern = Pattern.find(params[:id])

    if @pattern.update(pattern_params)
      redirect_to @pattern, notice: "Pattern successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @pattern = Pattern.find(params[:id])
    @pattern.destroy
    redirect_to root_path
  end

  private

  def pattern_params
    params.require(:pattern).permit(:name, :content, :user_id, :username, :id)
  end

end
