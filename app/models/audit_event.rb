class AuditEvent < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  belongs_to :auditable, polymorphic: true
end
