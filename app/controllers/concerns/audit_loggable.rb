# app/controllers/concerns/audit_loggable.rb
module AuditLoggable
  extend ActiveSupport::Concern

  included do
    after_action :audit_create,  only: :create,  unless: :devise_controller?
    after_action :audit_update,  only: :update,  unless: :devise_controller?
    after_action :audit_destroy, only: :destroy, unless: :devise_controller?
  end

  private

  def audit_create  = audit!("create")
  def audit_update  = audit!("update")
  def audit_destroy = audit!("destroy")

  def audit!(action)
    rec = instance_variable_get(:"@#{controller_name.singularize}")
    return unless rec&.respond_to?(:id)
    AuditEvent.create!(
      organization: current_user.organization,
      user: current_user,
      action: action,
      auditable: rec,
      data: params.to_unsafe_h.except(:password, :password_confirmation),
      ip: request.remote_ip,
      user_agent: request.user_agent
    )
  rescue => e
    Rails.logger.warn("AuditEvent skipped: #{e.class}: #{e.message}")
  end
end
