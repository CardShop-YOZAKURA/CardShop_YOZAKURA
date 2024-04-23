class Order < ApplicationRecord
  
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  
  with_options presence: true do
    validates :customer_id
    validates :postal_code
    validates :address
    validates :name
    validates :postage
    validates :billing_amount
    validates :payment_method
    validates :order_status
  end
  
            
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { 入金待ち: 0, 入金確認: 1, 商品準備中: 2, 発送準備中:  3, 発送済: 4 }
  
  def address_display
    '〒' + postal_code + '' + address + '' + name
  end
  
end
