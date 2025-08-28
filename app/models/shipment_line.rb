class ShipmentLine < ApplicationRecord
  belongs_to :organization
  belongs_to :shipment
  belongs_to :product
end
