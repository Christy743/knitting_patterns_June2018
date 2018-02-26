class OtherNotion < ActiveRecord::Base
  belongs_to :pattern

  #validates_presence_of :us_size, :name
end
