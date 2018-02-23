class NeedlesController < ApplicationController

  def index
    #binding.pry
    @needles = Needle.all
  end

  def new
    @needle = Needle.new
  end

  def show
    @needle = Needle.find(params[:id])
  end

  def create
    @needle = Needle.new(needle_params)
    #binding.pry
    if @needle.save
      redirect_to needle_path(@needle), notice: "You have successfully added needles."
    else
      render :new
    end
  end

  private

  def needle_params
    params.require(:needle).permit(:name, :us_size, :id, :pattern_id)
  end

end
