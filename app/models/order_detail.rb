class OrderDetail < ApplicationRecord
  
  belongs_to :item
  belongs_to :order
  
  with_options presence: true do
    validates :item_id
    validates :order_id
    validates :purchase_price
    validates :amount
    validates :making_status
  end
  
  # validates :item_id, :order_id, :purchase_price, :amount, :making_status, presence: true
  
  enum making_status: { 着手不可: 0, 商品準備中: 1, 商品梱包中: 2, 商品準備完了: 3 }
  
end
