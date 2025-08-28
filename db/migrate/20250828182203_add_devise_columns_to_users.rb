class AddDeviseColumnsToUsers < ActiveRecord::Migration[8.0]
  def change
    change_table :users, bulk: true do |t|
      t.string   :encrypted_password, null: false, default: "" unless column_exists?(:users, :encrypted_password)
      t.string   :reset_password_token unless column_exists?(:users, :reset_password_token)
      t.datetime :reset_password_sent_at unless column_exists?(:users, :reset_password_sent_at)
      t.datetime :remember_created_at unless column_exists?(:users, :remember_created_at)
      t.integer  :failed_attempts, default: 0, null: false unless column_exists?(:users, :failed_attempts)
      t.string   :unlock_token unless column_exists?(:users, :unlock_token)
      t.datetime :locked_at unless column_exists?(:users, :locked_at)
    end
    add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
    add_index :users, :unlock_token, unique: true         unless index_exists?(:users, :unlock_token)
  end
end
