class StockItem < ApplicationRecord
  belongs_to :organization
  belongs_to :product
  belongs_to :warehouse
end
