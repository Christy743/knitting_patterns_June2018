class Pattern < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :favorite_patterns, dependent: :destroy
  has_many :favorited_by, through: :favorite_patterns, source: :user

  def favorites_count
    self.favorite_patterns.size
  end

  #def user_attributes=(user_attributes)
  #  user_attributes.values.each do |u|
  #    self.user = User.find_or_create_by(username: u) if u != ""
  #  end
  #end

  def favorite_patterns_attributes=(favorite_pattern_attributes)
    favorite_pattern_attributes.values.each do |favorite_pattern_attribute|
      if favorite_pattern_attributes[:my_favorite].present?
      favorite_pattern = FavoritePattern.find_or_create_by(my_favorite: favorite_pattern_attributes[:my_favorite])
      self.favorite_patterns.build(my_favorite: my_favorite)
    end
    end
  end

end
