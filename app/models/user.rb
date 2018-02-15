class User < ActiveRecord::Base

  has_many :patterns
  has_many :favorite_patterns, through: :patterns

  has_secure_password

  validates_presence_of :email, uniqueness: true
  validates_presence_of :username, uniqueness: true 

end
