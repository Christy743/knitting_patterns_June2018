class PatternsController < ApplicationController

  def index
    @patterns = Pattern.all
    @categories = Category.all
    #binding.pry
  end

  def show
    #binding.pry
    @pattern = Pattern.find(params[:id])
    @needles = @pattern.needles
    @yarns = @pattern.yarns
    @other_notions = @pattern.other_notions
    @comment = Comment.new
    @category = Category.new
    #binding.pry
  end

  def new
    @pattern = Pattern.new
    2.times { @pattern.needles.new }
    2.times { @pattern.yarns.new }
    4.times { @pattern.other_notions.new }
    @pattern.categories.new
    #@needles = Needle.all
    #@pattern.needle.build
    #@needle = Needle.new
  end

  def create
    #user_id = current_user
    @pattern = current_user.patterns.new(pattern_params)
    @pattern.needles.new
    @pattern.yarns.new
    @pattern.other_notions.new
    @pattern.categories.new
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
    params.require(:pattern).permit(:name, :content, :user_id, :id, :needle_ids, :yarn_ids,
      needles_attributes: [:name, :us_size],
      yarns_attributes: [:name, :weight, :quantity],
      other_notions_attributes: [:notions],
      category_ids:[], categories_attributes: [:name]
      )
  end

end
