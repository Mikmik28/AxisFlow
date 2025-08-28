class CreateJournalEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :journal_entries do |t|
      t.references :organization, null: false, foreign_key: true
      t.date :posted_on
      t.string :reference
      t.string :description

      t.timestamps
    end
    add_index :journal_entries, :reference
  end
end
