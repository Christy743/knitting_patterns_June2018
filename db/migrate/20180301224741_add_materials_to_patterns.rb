class AddMaterialsToPatterns < ActiveRecord::Migration[5.1]
  def change
    add_column :patterns, :materials, :string
  end
end
