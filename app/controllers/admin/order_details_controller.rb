class Admin::OrderDetailsController < ApplicationController
  def update
    order_detail =OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)

    case order_detail.making_status
    when "商品準備中"
      order_detail.order.update(order_status: "商品準備中")
    when "商品梱包中"
      # if order_detail.order.order_details.all?{|order_detail| order_detail.making_status == "製作完了"}
      order_detail.order.update(order_status: "発送準備中")
      # end
    when "商品準備完了"
      order_detail.order.update(oeder_status: "発送済み")
    end
    redirect_to admins_order_path(order_detail.order.id)
  end

  private
  
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
