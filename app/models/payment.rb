class Payment < ApplicationRecord
  belongs_to :organization
  belongs_to :invoice
end
