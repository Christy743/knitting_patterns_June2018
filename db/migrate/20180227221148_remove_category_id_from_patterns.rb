class RemoveCategoryIdFromPatterns < ActiveRecord::Migration[5.1]
  def change
    remove_column :patterns, :category_id, :integer
  end
end
