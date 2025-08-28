class CreateSalesOrderLines < ActiveRecord::Migration[8.0]
  def change
    create_table :sales_order_lines do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :sales_order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :qty
      t.bigint :unit_price_cents
      t.string :currency, limit: 3

      t.timestamps
    end
  end
end
