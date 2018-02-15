class Patterns < ActiveRecord::Migration[5.1]
  def change
    create_table :patterns do |t|
      t.integer :user_id
      t.string :name
      t.string :content
    end
  end
end
