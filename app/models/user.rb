class User < ActiveRecord::Base
 validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :surname, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { maximum: 50 }
end
