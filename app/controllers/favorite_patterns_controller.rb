class FavoritePatternsController < ApplicationController

  def create
    current_user.favorite_patterns.create(:pattern_id => params[:pattern_id])
    if current_user.favorite_patterns.save
      redirect_to pattern_path(@pattern)
    else
    render 'patterns/show', :layout => false
    end
  end
end
