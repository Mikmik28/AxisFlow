class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :sku
      t.string :name
      t.string :unit
      t.string :barcode
      t.text :description
      t.bigint :price_cents
      t.string :currency, limit: 3

      t.timestamps
    end
    add_index :products, :sku
  end
end
