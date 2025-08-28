class CreateInvoices < ActiveRecord::Migration[8.0]
  def change
    create_table :invoices do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :sales_order, null: false, foreign_key: true
      t.string :invoice_no
      t.integer :status
      t.datetime :issued_at
      t.datetime :due_at
      t.string :currency, limit: 3
      t.bigint :total_cents

      t.timestamps
    end
    add_index :invoices, :invoice_no
  end
end
