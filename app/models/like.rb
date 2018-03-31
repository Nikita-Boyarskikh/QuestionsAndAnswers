class Like < ApplicationRecord
  resourcify
  belongs_to :author,   optional: true, class_name: 'User'
  belongs_to :question, optional: true
  belongs_to :answer,   optional: true

  validates :like, inclusion: { in: -1..1 }, presence: true, numericality: { only_integer: true }

  def to_s
    self.like ? 'Like' : 'Dislikle'
  end
end
