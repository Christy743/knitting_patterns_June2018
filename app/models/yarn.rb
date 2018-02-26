class Yarn < ActiveRecord::Base
  belongs_to :pattern

  #validates_presence_of :name, :weight
  #validates_presence_of :quantity, default: 0
end
