class Yarn < ActiveRecord::Base
  belongs_to :pattern

  validates_presence_of :name, :weight
end
