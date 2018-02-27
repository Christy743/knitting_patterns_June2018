class DropPatternCategories < ActiveRecord::Migration[5.1]
  def change
    drop_table :pattern_categories
  end
end
