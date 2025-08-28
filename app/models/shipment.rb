class Shipment < ApplicationRecord
  belongs_to :organization
  belongs_to :sales_order
end
