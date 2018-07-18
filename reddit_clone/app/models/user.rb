# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#

class User < ApplicationRecord
  validates :username, :password_digest, :session_token, presence: true
  validates :username, :session_token, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}
  attr_reader :password
  after_initialize :ensure_session_token
  
  has_many :subs,
  foreign_key: :moderator_id,
  class_name: :Sub
  
  has_many :posts,
  foreign_key: :author_id,
  class_name: :Post
  
  has_many :comments,
    foreign_key: :author_id,
    class_name: :Comment
  
  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user
    user.is_password?(password) ? user : nil
  end
  
  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    self.save
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
    self.session_token
  end
  
  private
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end
