class PurchaseOrderLine < ApplicationRecord
  belongs_to :organization
  belongs_to :purchase_order
  belongs_to :product
end
