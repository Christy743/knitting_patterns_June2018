class PatternsController < ApplicationController

  def index
    @patterns = Pattern.all
  end

  def show
    @pattern = Pattern.find(params[:id])
    @comments = @pattern.comments
    @favorited = FavoritePattern.find_by(user:current_user, pattern: @pattern).present?
  end

  def new
    @pattern = Pattern.new
    @pattern.favorite_patterns.build
  end

  def create
    @pattern = Pattern.new(pattern_params)
    @pattern.user = current_user
    binding.pry
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

  def favorite
    @pattern = Pattern.find(params[:id])
      current_user.favorites << @pattern
      redirect_to patterns_path, notice: "Added #{@pattern.name} to favorites"
  end

  def unfavorite
    @pattern = Pattern.find(params[:id])
      current_user.favorites.delete(@pattern)
      redirect_to patterns_path, notice: "Removed #{@pattern.name} from favorites"
  end

  private

  def pattern_params
    params.require(:pattern).permit(:id, :name, :content, :materials,
                                    :needles, :yarn, :weight, :quantity,
                                    favorite_pattern_ids: [],
                                    favorite_patterns_attributes: [:my_favorite])
  end

end
