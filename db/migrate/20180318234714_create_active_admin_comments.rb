class CreateActiveAdminComments < ActiveRecord::Migration::Current
  def self.up
    create_table :active_admin_comments do |t|
      t.string :namespace, null: false
      t.text   :body, null: false
      t.references :resource, polymorphic: true, null: false
      t.references :author, polymorphic: true, null: false
      t.timestamps
    end
    add_index :active_admin_comments, [:namespace]

  end

  def self.down
    drop_table :active_admin_comments
  end
end
