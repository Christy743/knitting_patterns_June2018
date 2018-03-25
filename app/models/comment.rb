class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  def user_attributes=(user_attributes)
   user_attributes.values.each do |u|
     self.user = User.find_or_create_by(username: u) if u != ""
   end
  end

end
