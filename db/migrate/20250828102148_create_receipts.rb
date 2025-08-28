class CreateReceipts < ActiveRecord::Migration[8.0]
  def change
    create_table :receipts do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :purchase_order, null: false, foreign_key: true
      t.string :receipt_no
      t.datetime :received_at

      t.timestamps
    end
    add_index :receipts, :receipt_no
  end
end
