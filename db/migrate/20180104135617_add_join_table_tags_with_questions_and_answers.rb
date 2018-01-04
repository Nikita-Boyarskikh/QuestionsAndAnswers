class AddJoinTableTagsWithQuestionsAndAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :tags_info, id: false do |t|
      t.belongs_to :tag,      foreign_key: true, null: false
      t.belongs_to :question, foreign_key: true
      t.belongs_to :answer,   foreign_key: true
    end
  end
end
