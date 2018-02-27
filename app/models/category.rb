class Category < ActiveRecord::Base
  has_many :pattern_categories
  has_many :patterns, through: :pattern_categories


end
