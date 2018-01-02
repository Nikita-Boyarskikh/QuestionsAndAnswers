class Question < ApplicationRecord
  has_many :tag
  has_many :answer
  has_many :like
  belongs_to :user
end
