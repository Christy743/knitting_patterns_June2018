class Needles < ActiveRecord::Migration[5.1]
  def change
    create_table :needles do |t|
      t.string :us_size
      t.string :name
      t.integer :pattern_id
    end
  end
end
