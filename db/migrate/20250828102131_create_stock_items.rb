class CreateStockItems < ActiveRecord::Migration[8.0]
  def change
    create_table :stock_items do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :warehouse, null: false, foreign_key: true
      t.integer :on_hand
      t.integer :reserved

      t.timestamps
    end
  end
end
