require 'openssl'

class User < ApplicationRecord

  INTEGRATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new

  has_many :questions

  validates :email, :name, presence: true
  validates :email, :username, uniqueness: true
  validates :email, format: { with: /@/ }
  validates :username, length: { maximum: 40 }, format: { with: /\A[A-Za-z]+_?\d*\z/ }
  validates :background, format: { with: /\A\#[\da-fA-Z]{6}\z/ }

  before_save :encrypt_password
  before_validation :downcase_username

  attr_accessor :password

  validates_presence_of :password, on: :create
  validates_confirmation_of :password

  def encrypt_password
    if self.password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, INTEGRATIONS, DIGEST.length, DIGEST)
      )
    end
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)
    if user.present? && user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, INTEGRATIONS, DIGEST.length, DIGEST))
      user
    else
      nil
    end
  end

  private

  def downcase_username
    if self.username.blank?
      return
    else
      self.username = username.downcase
    end
  end
end
