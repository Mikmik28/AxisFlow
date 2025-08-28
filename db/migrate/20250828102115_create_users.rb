class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :email
      t.string :encrypted_password
      t.string :first_name
      t.string :last_name
      t.string :role
      t.string :time_zone

      t.timestamps
    end
    add_index :users, :email
  end
end
