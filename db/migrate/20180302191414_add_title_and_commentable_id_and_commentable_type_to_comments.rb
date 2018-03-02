class AddTitleAndCommentableIdAndCommentableTypeToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :title, :string
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
    add_column :comments, :created_at, :datetime
    add_column :comments, :update_at, :datetime
  end
end
