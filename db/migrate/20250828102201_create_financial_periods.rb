class CreateFinancialPeriods < ActiveRecord::Migration[8.0]
  def change
    create_table :financial_periods do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :period
      t.date :starts_on
      t.date :ends_on
      t.boolean :closed

      t.timestamps
    end
    add_index :financial_periods, :period
  end
end
