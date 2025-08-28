class RoleAssignment < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  belongs_to :role
end
