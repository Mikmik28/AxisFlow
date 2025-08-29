# app/controllers/two_factor_controller.rb
class TwoFactorController < ApplicationController
  def show
    authorize current_user, :update?    # reuse a simple user policy or create one
    ensure_otp_secret!
    @provisioning_uri = current_user.otp_provisioning_uri(
      current_user.email,
      issuer: "AxisFlow"
    )
  end

  # Generate a fresh secret & show QR
  def create
    authorize current_user, :update?
    current_user.otp_required_for_login = false
    current_user.otp_backup_codes = nil
    current_user.otp_secret = User.generate_otp_secret
    current_user.save!
    redirect_to two_factor_path, notice: "Scan the QR code and confirm with a code."
  end

  # Confirm with a code from the authenticator app
  def update
    authorize current_user, :update?
    if current_user.validate_and_consume_otp!(params[:code])
      current_user.otp_required_for_login = true
      current_user.generate_otp_backup_codes!
      current_user.save!
      redirect_to root_path, notice: "Two-factor enabled."
    else
      redirect_to two_factor_path, alert: "Invalid code. Try again."
    end
  end

  # Disable 2FA
  def destroy
    authorize current_user, :update?
    current_user.update!(otp_required_for_login: false,
                         encrypted_otp_secret: nil,
                         encrypted_otp_secret_iv: nil,
                         encrypted_otp_secret_salt: nil,
                         otp_backup_codes: nil,
                         consumed_timestep: nil,
                         second_factor_attempts_count: 0)
    redirect_to root_path, notice: "Two-factor disabled."
  end

  private

  def ensure_otp_secret!
    return if current_user.otp_secret.present?
    current_user.otp_secret = User.generate_otp_secret
    current_user.save!
  end
end
