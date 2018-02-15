class OtherNotions < ActiveRecord::Migration[5.1]
  def change
    create_table :other_notions do |t|
      t.string :notions
    end
  end
end
