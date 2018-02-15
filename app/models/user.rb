class User < ActiveRecord::Base

  has_many :patterns
  has_many :favorite_patterns, through: :patterns

  has_secure_password

end
