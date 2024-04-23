class CartItem < ApplicationRecord
  
  belongs_to :item
  belongs_to :customer
  
  with_options presence: true do
    validates :item_id
    validates :customer_id
    validates :amount
  end
  
  
  # def subtotal
  #   item.price_including_tax * amount
  # end
  
end
