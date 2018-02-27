class PatternCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :pattern_categories do |t|
      t.integer :pattern_id
      t.integer :category_id
    end
  end
end
