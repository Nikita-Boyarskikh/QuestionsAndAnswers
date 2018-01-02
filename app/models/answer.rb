class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many :like
  has_many :tag
end
