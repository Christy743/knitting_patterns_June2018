class AddPatternIdtoOtherNotions < ActiveRecord::Migration[5.1]
  def change
    add_column :other_notions, :pattern_id, :integer
  end
end
