class CreateRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :roles do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
    add_index :roles, :name
  end
end
