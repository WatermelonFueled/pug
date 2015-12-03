class User < ActiveRecord::Base
  # constants
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #NOT FINAL
  MAX_NAME_LENGTH = 30
  MAX_EMAIL_LENGTH = 255

  before_save { self.email = email.downcase }
  has_secure_password

  validates :name,  presence: true,
                    length: { maximum: MAX_NAME_LENGTH }
  validates :email, presence: true,
                    length: { maximum: MAX_EMAIL_LENGTH },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password,  presence: true,
                        length: { minimum: 6 },
                        allow_nil: true   # allows for user update

  # returns hash digest of given string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
