class Address < ApplicationRecord
  
  belongs_to :address
  
  validates :customer_id, :name, :postal_code, :address, presence: true
  
end
