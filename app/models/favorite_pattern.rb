class FavoritePattern < ActiveRecord::Base
  belongs_to :user
  belongs_to :pattern

  #validates :user_id, uniqueness: { scope: :pattern_id }

  #scope :favorite,   -> { where(favorite: true) }
  #scope :unfavorite, -> { where(unfavorite: false) }

  #validates :favorited, limit: 1
end

# clone a pattern to make a favorite pattern
# has many - update table
# make an array of patterns to make favorite favorite_patterns

#has_many :books, class_name: "Transaction"
