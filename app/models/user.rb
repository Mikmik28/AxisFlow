class User < ApplicationRecord
  belongs_to :organization
  devise :database_authenticatable, :recoverable,
         :rememberable, :validatable, :lockable,
         :invitable, :two_factor_authenticatable, :two_factor_buckable,
         otp_secret_encryption_key: Rails.application.credentials.dig(:otp_encryption_key)

  serialize :otp_backup_codes, JSON
end
