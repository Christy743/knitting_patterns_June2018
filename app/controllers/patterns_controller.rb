class PatternsController < ApplicationController
  #skip_before_action :verify_authenticity_token, :only => :create, :show

  def index
    @patterns = Pattern.all
  end

  def show
    @pattern = Pattern.find(params[:id])
    #binding.pry
    #@comment = @pattern.comments.create
    #binding.pry
  end

  def new
    @pattern = Pattern.new
  end

  def create
    @pattern = Pattern.new(pattern_params)
    @pattern.user = current_user
    @favorite = FavoritePattern.current_user.favorites.create(params[:user_id, :pattern_id])
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
    redirect_to patterns_path
  end

  #def favorite_patterns
  #  binding.pry
  #  type = params[:type]
  #  if type == "favorite"
  #    current_user.favorite_pattern_ids << @pattern
  #    redirect_to pattern_favorite_patterns_path #, notice: "You favorited #{@pattern.name}."
  #  end
  #end

  def favorite
    @pattern = Pattern.find(params[:id])
    @favorite = FavoritePattern.find_by(user: current_user, pattern: @pattern).present?
    #binding.pry
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @pattern
      redirect_to patterns_path, notice: "Added #{@pattern.name} to favorites"
    elsif type == "unfavorite"
      current_user.favorites.delete(@pattern)
      redirect_to patterns_path, notice: "Removed #{@pattern.name} from favorites"
    else
      redirect_to patterns_path, notice: "Nothing happened"
    end
  end

  private

  def pattern_params
    params.require(:pattern).permit(:id, :name, :content, :materials,
      :needles, :yarn, :weight, :quantity)
  end

end
