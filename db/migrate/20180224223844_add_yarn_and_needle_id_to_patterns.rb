class AddYarnAndNeedleIdToPatterns < ActiveRecord::Migration[5.1]
  def change
    add_column :patterns, :needle_id, :integer
    add_column :patterns, :yarn_id, :integer
  end
end
