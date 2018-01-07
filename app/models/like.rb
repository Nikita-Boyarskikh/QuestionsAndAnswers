class Like < ApplicationRecord
  belongs_to :author,   optional: true, class_name: 'User'
  belongs_to :question, optional: true
  belongs_to :answer,   optional: true

  validates :like, inclusion: { in: -1..1 }, presence: true, numericality: { only_integer: true }
end
