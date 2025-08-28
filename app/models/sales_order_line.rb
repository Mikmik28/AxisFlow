class SalesOrderLine < ApplicationRecord
  belongs_to :organization
  belongs_to :sales_order
  belongs_to :product
end
