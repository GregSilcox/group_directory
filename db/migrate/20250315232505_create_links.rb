class CreateLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :links do |t|
      t.integer :from_id
      t.integer :to_id
      t.string :from_type
      t.string :to_type

      t.timestamps
    end
    add_index :links, :from_id
    add_index :links, :to_id
  end
end
