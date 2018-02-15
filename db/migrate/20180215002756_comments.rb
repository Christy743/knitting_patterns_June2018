class Comments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :pattern_id
    end
  end
end
