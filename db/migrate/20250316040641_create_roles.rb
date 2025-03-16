class CreateRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :roles do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :kind
      t.string :status

      t.timestamps
    end
    add_index :roles, :user_id
    add_index :roles, :group_id
  end
end
