class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { in: 9..30 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
    validates :password, presence: true, length: { minimum: 6 }
     validates :password_confirmation, presence: true
     has_secure_password      # A magic method!!
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
end