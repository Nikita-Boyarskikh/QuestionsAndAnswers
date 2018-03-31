class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :question, foreign_key: true
      t.references :answer,   foreign_key: true
      t.references :author, references: :users, index: true, null: false

      t.integer :like, null: false
      t.timestamps
    end
  end
end
