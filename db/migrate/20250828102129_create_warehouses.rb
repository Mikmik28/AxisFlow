class CreateWarehouses < ActiveRecord::Migration[8.0]
  def change
    create_table :warehouses do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :code
      t.string :name
      t.text :address

      t.timestamps
    end
    add_index :warehouses, :code
  end
end
