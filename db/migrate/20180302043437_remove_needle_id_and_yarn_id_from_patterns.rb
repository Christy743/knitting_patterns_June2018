class RemoveNeedleIdAndYarnIdFromPatterns < ActiveRecord::Migration[5.1]
  def change
    remove_column :patterns, :needle_id, :integer
    remove_column :patterns, :yarn_id, :integer
  end
end
