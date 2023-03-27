# frozen_string_literal: true

class User < ApplicationRecord
  has_many :blogs, dependent: :destroy

  validates :username, presence: true, uniqueness: { allow_blank: false, case_sensitive: true }
  validates :password, presence: { allow_blank: false }, length: { minimum: 6, message: '密码长度最短为6位' }
  validates :crypted_password, presence: { allow_blank: false }

  has_many :public_blogs, -> { where(is_public: true) }, class_name: 'Blog', inverse_of: :user, dependent: :destroy

  # before_validation :update_username

  attr_accessor :password, :password_confirmation # , :old_password

  validate :validate_password, on: :create
  before_validation :set_password

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    return unless user&.valid_password?(password)

    user
  end

  def valid_password?(password)
    crypted_password == Digest::SHA256.hexdigest(password + salt)
  end

  private

  def validate_password
    if password.blank?
      errors.add(:password, '密码不能为空')
      return false
    end

    unless password == password_confirmation
      errors.add(:password_confirmation, '密码不一致')
      return false
    end

    true
  end

  def set_password
    return if password.blank?

    self.salt = Time.now.to_i
    self.crypted_password = Digest::SHA256.hexdigest(password + salt)
  end

  def update_username
    return if username.blank?

    self.username = username.downcase
  end
end
