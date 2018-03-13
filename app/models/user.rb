class User < ActiveRecord::Base

  has_many :patterns #owns
  has_many :favorite_patterns
  has_many :favorites, through: :favorite_patterns, source: :pattern # , through: :patterns #don't necessarily own
  #has_many :comments #, as: :commentable
  #give class patterns
  #add a favorite to the original -

  #has many favorites only - give the foreign key
  #maybe source it to patterns - use pattern's id

  #before_save :store_settings



  attr_accessor :remember_token

  #attr_accessor :favorite_pattern

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  #validates :username, uniqueness: true
  validates :password, length: { in: 6..72 }
  #validates :bio, length: { maximum: 250 }

  #accepts_nested_attributes_for :patterns, reject_if: :all_blank

def self.current
  Thread.current[:user]
end

  def self.current=(user)
    Thread.current[:user] = user
  end
  #def favorited(pattern)
  #  #binding.pry
  #  @self.favorites << pattern
  #end

  #def store_settings
  #  self.settings = {favorite_pattern: favorite_pattern}
  #end

  #def favorite_patterns_attributes=(favorite_pattern_attributes)
  #  favorite_pattern_attributes.values.each do |favorite_pattern_attribute|
  #    favorite_pattern = FavoritePattern.find_or_create_by(favorite_pattern_attribute)
  #    self.favorite_patterns << favorite_pattern
  #  end
  #end

  #def favorite?(user)
  #  true if self.patterns & user.patterns
  #end

  #def current_user_favorite?
  #  if current_user.suggest_books_from?(user)
  #    user.books - current_user.books
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
