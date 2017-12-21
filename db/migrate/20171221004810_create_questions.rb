class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title,      limit: 30
      t.text :text,         null: false
      t.integer :rating,    default: 0
      t.references :tag,    foreign_key: true
      t.references :author, foreign_key: true

      t.timestamps
    end
    add_index :questions, :title
    add_index :questions, :tag
    add_index :questions, :author
  end
end
