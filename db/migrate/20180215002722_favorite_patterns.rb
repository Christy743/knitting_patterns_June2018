class FavoritePatterns < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_patterns do |t|
      t.integer :user_id
      t.integer :pattern_id
    end
  end
end
