class ReceiptLine < ApplicationRecord
  belongs_to :organization
  belongs_to :receipt
  belongs_to :product
end
