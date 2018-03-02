class DropOtherNotionsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :other_notions
  end
end
