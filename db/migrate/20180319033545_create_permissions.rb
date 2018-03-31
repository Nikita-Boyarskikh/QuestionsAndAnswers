class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :allow_subject_class
      t.integer :disallow_subject_class
      t.integer :subject_id
      t.string :action, null: false
      t.text :description, default: ''

      t.timestamps
    end
  end
end
