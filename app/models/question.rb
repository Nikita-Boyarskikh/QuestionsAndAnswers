class Question < ApplicationRecord
  after_create ->(record) { change_questions_count record.author_id, :users, 1 }
  after_destroy ->(record) { change_questions_count record.author_id, :users, -1 }
  before_validation :fix_tags_format

  has_and_belongs_to_many :tags, join_table: 'tags_info',
                          after_add:    ->(tag) { tag.increment!(:question_count) },
                          after_remove: ->(tag) { tag.increment!(:question_count, -1) }
  has_many   :answers, dependent: :destroy
  has_many   :likes,   dependent: :destroy
  belongs_to :author, class_name: 'User', optional: true

  validates :title, length: { in: 3..255 }
  validates :text, presence: true
  validates :rating, numericality: { only_integer: true }

  def self.hot(n=10)
    self.order(rating: :desc, created_at: :desc, title: :asc).limit(n)
  end

  private

  def change_questions_count(id, table, delta)
    ActiveRecord::Base.connection.execute <<-SQL.squish
      UPDATE #{table} SET questions_count = questions_count + (#{delta}) WHERE id = #{id};
    SQL
  end
end
