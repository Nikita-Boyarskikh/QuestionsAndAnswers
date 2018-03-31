class Answer < ApplicationRecord
  resourcify
  after_create  ->(record) { change_answers_count record.author_id, :users, 1 },
                ->(record) { change_answers_count record.question_id, :questions, 1 }
  after_destroy ->(record) { change_answers_count record.author_id, :users, -1 },
                ->(record) { change_answers_count record.question_id, :questions, -1 }

  belongs_to :question
  belongs_to :author,     class_name: 'User', optional: true
  has_many   :likes,      dependent: :destroy
  has_and_belongs_to_many :tags, join_table: 'tags_info',
                          after_add:    ->(answer, tag) { tag.increment!(:answers_count) },
                          after_remove: ->(answer, tag) { tag.increment!(:answers_count, -1) }

  default_scope { includes(:author, :tags) }

  validates :text, presence: true
  validates :rating, numericality: { only_integer: true }

  scope :hot, ->(n=10) { order(rating: :desc, created_at: :desc).limit(n) }

  private

  def change_answers_count(id, table, delta)
    return unless id and table and delta
    ActiveRecord::Base.connection.execute <<-SQL.squish
      UPDATE #{table} SET answers_count = answers_count + (#{delta}) WHERE id = #{id};
    SQL
  end

  def to_s
    self.text
  end
end
