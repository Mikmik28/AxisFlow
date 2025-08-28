class CreateShipmentLines < ActiveRecord::Migration[8.0]
  def change
    create_table :shipment_lines do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :shipment, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :qty

      t.timestamps
    end
  end
end
