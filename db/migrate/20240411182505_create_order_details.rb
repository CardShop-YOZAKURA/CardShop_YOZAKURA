class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :purchase_price, null: false
      t.integer :amount, null: false
      t.integer :making_status, null: false, default: true    #enumで管理   0:着手不可 1:商品準備中 2:商品梱包中 3:商品準備完了
      
      t.timestamps
    end
  end
end
