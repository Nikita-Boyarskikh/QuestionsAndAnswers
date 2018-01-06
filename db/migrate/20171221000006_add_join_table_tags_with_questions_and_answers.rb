class AddJoinTableTagsWithQuestionsAndAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :tags_info, id: false do |t|
      t.references :tag,      foreign_key: true, null: false
      t.references :question, foreign_key: true
      t.references :answer,   foreign_key: true
    end
  end
end
