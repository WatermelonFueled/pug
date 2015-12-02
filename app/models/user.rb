class User < ActiveRecord::Base
  # constants
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #NOT FINAL
  MAX_NAME_LENGTH = 30
  MAX_EMAIL_LENGTH = 255

  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: MAX_NAME_LENGTH }
  validates :email, presence: true,
                    length: { maximum: MAX_EMAIL_LENGTH },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
