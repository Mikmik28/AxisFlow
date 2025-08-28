class StockMovement < ApplicationRecord
  belongs_to :organization
  belongs_to :product
  belongs_to :warehouse
  belongs_to :reference, polymorphic: true
end
