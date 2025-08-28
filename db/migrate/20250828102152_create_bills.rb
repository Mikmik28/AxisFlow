class CreateBills < ActiveRecord::Migration[8.0]
  def change
    create_table :bills do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :vendor, null: false, foreign_key: true
      t.string :bill_no
      t.integer :status
      t.datetime :issued_at
      t.datetime :due_at
      t.string :currency, limit: 3
      t.bigint :total_cents

      t.timestamps
    end
    add_index :bills, :bill_no
  end
end
