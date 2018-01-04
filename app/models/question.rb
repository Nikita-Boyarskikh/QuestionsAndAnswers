class Question < ApplicationRecord
  has_and_belongs_to_many :tag, join_table: 'tags_info'
  has_many   :answer, dependent: :destroy
  has_many   :like,   dependent: :destroy
  belongs_to :author, class_name: 'User', optional: true
end
