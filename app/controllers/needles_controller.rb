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

  def edit
    @needle = Needle.find(params[:id])
  end

  def update
    @needle = Needle.find(params[:id])

    if @needle.update(needle_params)
      redirect_to @needle, notice: "Needle successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @needle = Needle.find(params[:id])
    @needle.destroy
    redirect_to root_path
  end

  private

  def needle_params
    params.require(:needle).permit(:name, :us_size, :id, :pattern_id)
  end

end
