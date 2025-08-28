class SalesOrder < ApplicationRecord
  belongs_to :organization
  belongs_to :customer
end
