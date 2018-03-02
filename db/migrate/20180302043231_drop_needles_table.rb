class DropNeedlesTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :needles
  end
end
