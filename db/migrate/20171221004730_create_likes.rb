class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :question, foreign_key: true
      t.references :answer,   foreign_key: true

      t.integer :like, null: false
      t.timestamps
    end

    add_reference   :likes, :author, references: :users, index: true
    add_foreign_key :likes, :users,  column: :author_id
  end
end
