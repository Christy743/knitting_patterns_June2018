class User < ActiveRecord::Base
  has_many :patterns
  has_many :favorite_patterns, dependent: :destroy
  has_many :favorites, through: :favorite_patterns, source: :pattern

  attr_accessor :remember_token

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :password, length: { in: 6..72 }

  #def favorite_patterns_attributes=(favorite_pattern_attributes)
  #  favorite_pattern_attributes.values.each do |favorite_pattern_attribute|
  #    if favorite_pattern_attributes[:my_favorite].present?
  #    favorite_pattern = FavoritePattern.find_or_create_by(my_favorite: favorite_pattern_attributes[:my_favorite])
  #    self.favorite_patterns.build(my_favorite: my_favorite)
  #  end
  #  end
  #end

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

  #def favorite_patterns_attributes=(favorite_pattern_attributes)
  #  favorite_pattern_attributes.values.each do |favorite_pattern_attribute|
  #    favorite_pattern = FavoritePattern.find_or_create_by(favorite_pattern_attribute)
  #    self.favorite_patterns << favorite_pattern
  #  end
  #end

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(email: auth_hash["info"]["email"]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

end
