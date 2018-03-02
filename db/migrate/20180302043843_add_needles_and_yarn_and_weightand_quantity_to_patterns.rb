class AddNeedlesAndYarnAndWeightandQuantityToPatterns < ActiveRecord::Migration[5.1]
  def change
    add_column :patterns, :needles, :string
    add_column :patterns, :yarn, :string
    add_column :patterns, :weight, :string
    add_column :patterns, :quantity, :integer
  end
end
