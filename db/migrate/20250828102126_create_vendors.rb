class CreateVendors < ActiveRecord::Migration[8.0]
  def change
    create_table :vendors do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.string :phone
      t.string :tax_id

      t.timestamps
    end
  end
end
