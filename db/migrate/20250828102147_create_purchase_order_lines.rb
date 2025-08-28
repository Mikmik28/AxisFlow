class CreatePurchaseOrderLines < ActiveRecord::Migration[8.0]
  def change
    create_table :purchase_order_lines do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :purchase_order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :qty
      t.bigint :unit_cost_cents
      t.string :currency, limit: 3

      t.timestamps
    end
  end
end
