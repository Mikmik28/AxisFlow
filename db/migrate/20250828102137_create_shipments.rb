class CreateShipments < ActiveRecord::Migration[8.0]
  def change
    create_table :shipments do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :sales_order, null: false, foreign_key: true
      t.string :shipment_no
      t.integer :status
      t.datetime :shipped_at

      t.timestamps
    end
    add_index :shipments, :shipment_no
  end
end
