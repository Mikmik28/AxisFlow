class CreateSalesOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :sales_orders do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.string :order_no
      t.integer :status
      t.datetime :ordered_at
      t.string :currency, limit: 3
      t.bigint :total_cents

      t.timestamps
    end
    add_index :sales_orders, :order_no
  end
end
