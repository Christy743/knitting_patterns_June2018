class Pattern < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  #has_many :users, through: :comments
  has_many :favorite_patterns #through users?
  has_many :favorited_by, through: :favorite_patterns, source: :user
  #owner id matches it's user id - differentiate the users

  #validates_presence_of :name, :content

  #accepts nested attribute custom method for needles and yarn

  #def pattern
  #  commentable.is_a?(Pattern) ? commentable : commentable.pattern
  #end

  def favorites_count
    self.favorite_patterns.size
  end

  #def favorite_patterns_attributes=(favorite_pattern_attributes)
  #  favorite_pattern_attributes.values.each do |favorite_pattern_attribute|
  #    favorite_pattern = FavoritePattern.find_or_create_by(favorite_pattern_attribute)
  #    self.favorite_patterns << favorite_pattern
  #  end
  #end

  #def grouped_comments
  #  grouped_comments_hash = {}
  #  self.comments.each do |comment|
  #    if grouped_comments_hash.keys.include?(comment.user.username)
  #      grouped_comments_hash[comment.user.username] << comment
  #    else
  #      grouped_comments_hash[comment.user.username] = [comment]
  #    end
  #  end
  #  grouped_comments_hash
  #end

end
