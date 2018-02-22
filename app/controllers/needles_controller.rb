class NeedlesController < ApplicationController

  def index
    @needles = Needle.all
  end

  def new
    @needle = Needle.new
  end

  def show
    @needle = Needle.find(params[:id])
  end


end
