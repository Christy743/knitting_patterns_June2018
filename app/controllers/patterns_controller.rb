class PatternsController < ApplicationController
before_action :set_pattern, only: [:show, :edit, :update, :destroy]

  def index
    @patterns = Pattern.all
    #@content = Pattern.content
    #render 'patterns/index', :layout => false

    respond_to do |format|
     format.html
     format.json {render json: @patterns}
    end

  end

  def show
    @pattern = Pattern.find(params[:id])
    @comments = @pattern.comments
    @comment = @pattern.comments.build
    @favorited = FavoritePattern.find_by(user:current_user, pattern: @pattern).present?

    respond_to do |format|
      format.html
      format.json {render json: @pattern}
    end
  end

  def new
    @pattern = Pattern.new
    @pattern.favorite_patterns.build
    @pattern.favorite_patterns << FavoritePattern.new
  end

  def create
    @pattern = Pattern.new(pattern_params)
    @pattern.user = current_user
    if @pattern.save
      redirect_to pattern_path(@pattern), notice: "You have successfully made a pattern!"
    else
      render :new
    end
  end

   # def content
   #   pattern = Pattern.find(params[:id])
   #   render plain: pattern.content
   # end

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
      redirect_to pattern_path, notice: "Added #{@pattern.name} to favorites"
  end

  def unfavorite
    @pattern = Pattern.find(params[:id])
      current_user.favorites.delete(@pattern)
      redirect_to pattern_path, notice: "Removed #{@pattern.name} from favorites"
  end

  private

  def pattern_params
    params.require(:pattern).permit(:id, :name, :content, :materials,
                                    :needles, :yarn, :weight, :quantity,
                                    favorite_pattern_ids: [],
                                    favorite_patterns_attributes: [:id, :user_id, :pattern_id, :my_favorite])
  end

  def set_pattern
    @pattern = Pattern.find_by_id(params[:id])
  end

end
