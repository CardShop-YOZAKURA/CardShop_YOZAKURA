class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :postage, null: false
      t.integer :billing_amount, null: false
      t.integer :payment_method, null: false    #enumで管理　0:クレジットカード 1:銀行振り込み
      t.integer :order_status, null: false, default: 0    #enumで管理　0:入金待ち 1:入金確認 2:商品準備中 3:発送準備中 4:発送済 
      
      t.timestamps
    end
  end
end
