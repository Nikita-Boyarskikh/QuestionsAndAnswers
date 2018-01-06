class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :title, limit: 255

      t.integer :questions_count, default: 0, null: false
      t.integer :answers_count,   default: 0, null: false

      t.timestamps
    end
    add_index :tags, :title, unique: true
  end
end
