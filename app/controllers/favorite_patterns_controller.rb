class FavoritePatternsController < ApplicationController

  def create
    current_user.favorite_patterns.create(:pattern_id => params[:pattern_id])
    render 'create.js', :layout => false
  end
end
