class CreateVendorPayments < ActiveRecord::Migration[8.0]
  def change
    create_table :vendor_payments do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :bill, null: false, foreign_key: true
      t.bigint :amount_cents
      t.string :currency, limit: 3
      t.string :method
      t.datetime :paid_at
      t.string :reference_no

      t.timestamps
    end
  end
end
