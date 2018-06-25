class Pattern < ActiveRecord::Base
  belongs_to :user
  has_many :comments  #, as: :commentable
  has_many :favorite_patterns, dependent: :destroy
  has_many :favorited_by, through: :favorite_patterns, source: :user

  validates_presence_of :name, :content, :materials,
                        :needles, :yarn, :weight, :quantity

  def favorites_count
    self.favorite_patterns.size
  end

  def favorite_patterns_attributes=(favorite_pattern_attributes)
    favorite_pattern_attributes.values.each do |favorite_pattern_attribute|
      if favorite_pattern_attributes[:my_favorite].present?
        favorite_pattern = FavoritePattern.find_or_create_by(my_favorite: favorite_pattern_attributes[:my_favorite])
        if !self.favorite_patterns.include?(favorite_pattern)
        self.favorite_patterns.build(my_favorite: my_favorite)
        end
      end
    end
  end

  def next
    pattern = Pattern.where("id > ?", id).first

    if pattern
      pattern
    else
      Pattern.first
    end

  end

end
