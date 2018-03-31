class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :text
      t.integer    :rating,   default: 0
      t.boolean    :is_best,  default: false
      t.references :question, foreign_key: true, null: false

      t.timestamps
    end

    add_reference   :answers, :author, references: :users, index: true, null: false
    add_foreign_key :answers, :users,  column: :author_id
  end
end
