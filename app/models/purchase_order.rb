class PurchaseOrder < ApplicationRecord
  belongs_to :organization
  belongs_to :vendor
end
