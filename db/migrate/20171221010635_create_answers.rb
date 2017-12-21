class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :text
      t.integer :rating
      t.boolean :is_best,     default: false
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
