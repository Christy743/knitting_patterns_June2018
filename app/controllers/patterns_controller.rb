class PatternsController < ApplicationController

  def index
    @patterns = Pattern.all
  end

  def show
    @pattern = Pattern.find(params[:id])
  end

  def new
    @pattern = Pattern.new
  end

  def create
    #binding.pry
    @pattern = Pattern.new(pattern_params)
    if @pattern.save
      redirect_to pattern_path, notice: "You have successfully made a pattern!"
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

  private

  def pattern_params
    params.require(:pattern).permit(:name, :content, :user_id)
  end

end
