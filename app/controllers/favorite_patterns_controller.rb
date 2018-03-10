class FavoritePatternsController < ApplicationController

  def create
    @favorite_pattern = current_user.favorite.create(params[:user_id])
  end

end
