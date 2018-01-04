class Like < ApplicationRecord
  belongs_to :author,   optional: true, class_name: 'User'
  belongs_to :question, optional: true
  belongs_to :answer,   optional: true
end
