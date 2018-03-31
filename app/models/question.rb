class Question < ApplicationRecord
  resourcify
  after_create ->(record) { change_questions_count record.author_id, :users, 1 }
  after_destroy ->(record) { change_questions_count record.author_id, :users, -1 }

  has_and_belongs_to_many :tags, join_table: 'tags_info',
                          after_add:    ->(question, tag) { tag.increment!(:questions_count) },
                          after_remove: ->(question, tag) { tag.increment!(:questions_count, -1) }
  has_many   :answers, dependent: :destroy
  has_many   :likes,   dependent: :destroy
  belongs_to :author, class_name: 'User', optional: true

  default_scope { includes(:author, :tags, :answers) }

  validates :title, presence: true, length: { in: 3..255 }
  validates :text, presence: true
  validates :rating, numericality: { only_integer: true }

  scope :hot, ->(n=10) { order(rating: :desc, created_at: :desc, title: :asc).limit(n) }

  private

  def change_questions_count(id, table, delta)
    return unless id and table and delta
    ActiveRecord::Base.connection.execute <<-SQL.squish
      UPDATE #{table} SET questions_count = questions_count + (#{delta}) WHERE id = #{id};
    SQL
  end

  def to_s
    self.title
  end
end
