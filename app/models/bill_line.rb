class BillLine < ApplicationRecord
  belongs_to :organization
  belongs_to :bill
  belongs_to :product
end
