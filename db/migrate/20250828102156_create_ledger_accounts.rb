class CreateLedgerAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :ledger_accounts do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :code
      t.string :name
      t.integer :kind
      t.bigint :parent_id

      t.timestamps
    end
    add_index :ledger_accounts, :code
  end
end
