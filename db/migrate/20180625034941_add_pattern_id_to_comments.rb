class AddPatternIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :pattern_id, :integer
  end
end
