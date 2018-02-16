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

  #def self.from_omniauth(auth)
  #  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
  #    user.provider = auth.provider
  #    user.uid = auth.uid
  #    user.name = auth.info.name
  #    user.oauth_token = auth.credentials.token
  #    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  #    user.save!
  #  end
  #end

  #def self.from_omniauth(auth)
  #  where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
  #    user.provider = auth.provider
  #    user.uid = auth.uid
  #    user.name = auth.info.name unless user.name != nil
  #    user.email = SecureRandom.hex + '@example.com' unless user.email != nil
  #    user.activated = true
  #    user.password = SecureRandom.urlsafe_base64 unless user.password != nil
  #    user.save!
  #  end
  #end

    #find_by_provider_and_password_digest(auth["provider"], auth["uid"]) || create_with_omniauth(auth)


  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.password_digest = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

end
