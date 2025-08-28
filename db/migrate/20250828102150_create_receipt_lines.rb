class CreateReceiptLines < ActiveRecord::Migration[8.0]
  def change
    create_table :receipt_lines do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :receipt, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :qty

      t.timestamps
    end
  end
end
