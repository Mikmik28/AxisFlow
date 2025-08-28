class ProductPolicy < ApplicationPolicy
  def index?  = true
  def show?   = same_org?
  def create? = admin_or_manager?
  def update? = admin_or_manager?
  def destroy? = admin?

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve = scope.where(organization: user.organization)
  end

  private

  def same_org? = record.organization == user.organization
  def admin_or_manager? = %w[admin manager].include?(user.role)
  def admin? = user.role == "admin"
end
