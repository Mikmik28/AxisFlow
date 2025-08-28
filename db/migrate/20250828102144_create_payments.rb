class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :invoice, null: false, foreign_key: true
      t.bigint :amount_cents
      t.string :currency, limit: 3
      t.string :method
      t.datetime :received_at
      t.string :reference_no

      t.timestamps
    end
  end
end
