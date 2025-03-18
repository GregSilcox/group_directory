class CreateEmailAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :email_addresses do |t|
      t.string :address
      t.string :kind
      t.string :status

      t.timestamps
    end
    add_index :email_addresses, :address
  end
end
