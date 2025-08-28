class VendorPayment < ApplicationRecord
  belongs_to :organization
  belongs_to :bill
end
