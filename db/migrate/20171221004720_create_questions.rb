class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string     :title,  limit: 30
      t.text       :text,   null: false
      t.integer    :rating, default: 0

      t.timestamps
    end

    add_reference   :questions, :author, references: :users, index: true
    add_foreign_key :questions, :users,  column: :author_id
    add_index       :questions, :title
  end
end
