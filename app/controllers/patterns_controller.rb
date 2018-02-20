class PatternsController < ApplicationController

  def index
    @patterns = Pattern.all
  end

  def show
    @pattern = Pattern.find(params [:id])
  end

  def new
    @pattern = Pattern.new
  end

  def create
    @pattern = Pattern.new(pattern_params)
    if @pattern.save
      redirect_to pattern_path, notice: "You have successfully made a pattern!"
    else
      render :new
    end
  end

  private

  def pattern_params
    params.require(:pattern).permit(:name, :content)
  end

end
