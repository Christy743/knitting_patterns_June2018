class FavoritePatternsController < ApplicationController

  def create
    @favorited = FavoritePattern.new(params[:user_id, :pattern_id])
  end

end
