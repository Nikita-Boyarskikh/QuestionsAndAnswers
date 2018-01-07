class Tag < ApplicationRecord
  has_and_belongs_to_many :questions, join_table: 'tags_info',
                          after_add:    :inc_counter,
                          after_remove: :dec_counter
  has_and_belongs_to_many :answers, join_table: 'tags_info',
                          after_add:    :inc_counter,
                          after_remove: :dec_counter

  validates :title, uniqueness: { case_sensitive: false }, presence: true, length: { in: 3..255 }

  def self.hot(n=10)
    self.select('questions_count + answers_count AS rating').order(rating: :desc, created_at: :desc, title: :asc).limit(n)
  end
end
