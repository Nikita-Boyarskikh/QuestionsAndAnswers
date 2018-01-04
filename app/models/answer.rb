class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :author,   optional: true, class_name: 'User'
  has_many   :like,     dependent: :nullify
  has_and_belongs_to_many :tag, join_table: 'tags_info'
end
