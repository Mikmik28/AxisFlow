class CreateStockMovements < ActiveRecord::Migration[8.0]
  def change
    create_table :stock_movements do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :warehouse, null: false, foreign_key: true
      t.integer :qty_delta
      t.string :reason
      t.references :reference, polymorphic: true, null: false

      t.timestamps
    end
  end
end
