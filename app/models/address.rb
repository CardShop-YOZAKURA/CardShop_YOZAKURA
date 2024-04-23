class Address < ApplicationRecord
  
  belongs_to :address
  
  with_options presence: true do
    validates :customer_id
    validates :name
    validates :postal_code
    validates :address
  end
  
  
end
