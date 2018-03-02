class RemovePatternIdAndUserIdFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :pattern_id, :integer
    remove_column :comments, :user_id, :integer
  end
end
