class PatternsController < ApplicationController

  def index
    @patterns = Pattern.all
    #binding.pry
  end

  def show
    @pattern = Pattern.find(params[:id])
    #@needles = @pattern.needles
    #@yarn = @pattern.yarn_id
    #@other_notion = @pattern.other_notion
    #@user = User.find(params[:id])
    @comment = Comment.new
  end

  def new
    @pattern = Pattern.new
    #@pattern.yarns.build
    #@needles = Needle.new
    #@yarn = Yarn.new
    #@pattern.yarn_id
    #@pattern.needle_id
    #@pattern.other_notion_id
    #@pattern.yarns.build
    #@pattern = current_user.patterns.build
    #@user = current_user
  end

  def create
      #binding.pry

    @pattern = Pattern.new(pattern_params)
    @pattern.user = current_user

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
    redirect_to patterns_path
  end

  private

  def pattern_params
    params.require(:pattern).permit(:id, :name, :content, :materials,
      yarns_attributes: [:name, :weight, :quantity],
      needles_attributes: [:name, :us_size]
      )
  end

end
