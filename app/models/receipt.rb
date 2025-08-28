class Receipt < ApplicationRecord
  belongs_to :organization
  belongs_to :purchase_order
end
