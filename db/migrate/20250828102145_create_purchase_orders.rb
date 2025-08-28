class CreatePurchaseOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :purchase_orders do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :vendor, null: false, foreign_key: true
      t.string :po_no
      t.integer :status
      t.datetime :ordered_at
      t.string :currency, limit: 3
      t.bigint :total_cents

      t.timestamps
    end
    add_index :purchase_orders, :po_no
  end
end
