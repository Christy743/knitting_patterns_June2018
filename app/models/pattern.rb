class Pattern < ActiveRecord::Base
  belongs_to :user
  has_many :needles
  has_many :yarns
  has_many :comments

  validates_presence_of :name, :content
end
