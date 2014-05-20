class User < ActiveRecord::Base
  has_many :offers, dependent: :destroy
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :surname, presence: true, length: { maximum: 50 }
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..40 },
                       :unless => :already_has_password?
  has_secure_password
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Offer.where("user_id = ?", id)
  end

  private

    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end

    def already_has_password?
      !self.password_digest.blank?
    end
end
