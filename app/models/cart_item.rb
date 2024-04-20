class CartItem < ApplicationRecord
  
  belongs_to :item
  belongs_to :customer
  
  validates :item_id, :customer_id, :amount, presence: true
  
  # def subtotal
  #   item.price_including_tax * amount
  # end
  
end
