class Question < ApplicationRecord
  belongs_to :tag
  belongs_to :author
end
