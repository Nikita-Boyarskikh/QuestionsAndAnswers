class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :answers
  has_many :questions
  has_many :likes
  has_one  :avatar

  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  validates :nickname, format: { with: /\A[^0-9]\w+\z/i }, uniqueness: { case_sensitive: false }
  validates :reset_password_token, uniqueness: true
  validates :sign_in_count, presence: true
  validates :fullname, presence: true
  validates :encrypted_password, presence: true

  def self.top(n=10)
    self.select('*, answers_count + questions_count AS rating').order('rating DESC, created_at, nickname').limit(n)
  end
end
