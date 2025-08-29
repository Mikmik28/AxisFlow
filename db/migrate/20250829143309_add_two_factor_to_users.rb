class AddTwoFactorToUsers < ActiveRecord::Migration[8.0]
  def change
    # Encrypted secret columns (used when otp_secret_encryption_key is set)
    add_column :users, :encrypted_otp_secret, :string
    add_column :users, :encrypted_otp_secret_iv, :string
    add_column :users, :encrypted_otp_secret_salt, :string

    add_column :users, :consumed_timestep, :integer
    add_column :users, :otp_required_for_login, :boolean, null: false, default: false
    add_column :users, :otp_backup_codes, :text
    add_column :users, :second_factor_attempts_count, :integer, null: false, default: 0

    add_index :users, :otp_required_for_login
  end
end
