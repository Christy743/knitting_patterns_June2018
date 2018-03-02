class DropYarnsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :yarns
  end
end
