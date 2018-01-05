class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :answer
  has_many :question
  has_many :like
  has_one  :avatar
end
