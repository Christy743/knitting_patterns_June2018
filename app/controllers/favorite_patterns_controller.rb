class FavoritePatternsController < ApplicationController

  def create
    @favorite_pattern = FavoritePattern.current_user.favorites.create(params[:user_id, :pattern_id])
  end

end
