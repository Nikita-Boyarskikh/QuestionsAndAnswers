class Tag < ApplicationRecord
  has_and_belongs_to_many :question, join_table: 'tags_info'
  has_and_belongs_to_many :answer,   join_table: 'tags_info'
end
