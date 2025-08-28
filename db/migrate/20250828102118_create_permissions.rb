class CreatePermissions < ActiveRecord::Migration[8.0]
  def change
    create_table :permissions do |t|
      t.string :key
      t.string :description

      t.timestamps
    end
    add_index :permissions, :key
  end
end
