class PatternCategory < ActiveRecord::Base
  belongs_to :pattern
  belongs_to :category
end
