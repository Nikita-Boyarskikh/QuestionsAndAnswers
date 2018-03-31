class User < ApplicationRecord
  rolify
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :permissions
  has_many :answers
  has_many :questions
  has_many :likes
  has_one  :avatar

  validates :email, presence: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  validates :nickname, presence: true, format: { with: /\A[^0-9]\w+\z/i }, uniqueness: { case_sensitive: false }
  validates :reset_password_token, uniqueness: true
  validates :sign_in_count, presence: true
  validates :fullname, presence: true

  scope :top, ->(n=10) do
    select('*, answers_count + questions_count AS rating').order('rating DESC, created_at, nickname').limit(n)
  end

  def to_s
    self.fullname || self.nickname
  end
end
