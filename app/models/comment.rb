class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  #has_many :comments, as: :commentable
  #belongs_to :user


  def user_attributes=(user_attributes)

  	user_attributes.values.each do |u|
  		self.user = User.find_or_create_by(username: u) if u != ""
  	end
  end

  #def pattern
  #  return @pattern if defined?(@pattern)
  #  @pattern = commentable.is_a?(Pattern) ? commentable : commentable.pattern
  #end

end
