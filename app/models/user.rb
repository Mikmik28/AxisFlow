class User < ApplicationRecord
  belongs_to :organization
  devise :database_authenticatable, :recoverable,
         :rememberable, :validatable, :lockable
end
