class AddMyFavoriteToFavoritePatterns < ActiveRecord::Migration[5.1]
  def change
    add_column :favorite_patterns, :my_favorite, :string
  end
end
