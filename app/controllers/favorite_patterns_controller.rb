class FavoritePatternsController < ApplicationController

  def create
    @favorite = FavoritePattern.new(params[:user_id, :pattern_id])
  end

end
