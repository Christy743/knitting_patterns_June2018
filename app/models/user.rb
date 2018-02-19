class User < ActiveRecord::Base

  has_many :patterns
  has_many :favorite_patterns, through: :patterns

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  #validates :username, uniqueness: true
  validates :password, length: { in: 6..72 }
  validates :bio, length: { maximum: 250 }


  def self.find_or_create_by_omniauth(auth_hash)
    self.where(email: auth_hash["info"]["email"]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end

end
