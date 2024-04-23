class Public::OrdersController < ApplicationController
  def new
  end

  def index
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name,
    :postage, :billing_amount, :payment_method, :order_status
    )
  end
  
end
