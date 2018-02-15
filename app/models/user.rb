class User < ActiveRecord::Base

  has_many :patterns
  has_many :favorite_patterns, through: :patterns

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :username, presence: true, length: { minimum: 5  },
                       uniqueness: true
  validates :password, length: { in: 6..20 }
  validates :bio, length: { maximum: 250 }

end
