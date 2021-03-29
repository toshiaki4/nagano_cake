class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    # if @order.update(order_params)
    #   redirect_to admin_order_path(@order)
    # end  
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      if @order.order_status == "入金確認"
        @order.order_details.update(production_status:"製作待ち")
      end  
       redirect_to admin_order_path(@order)
    end 
  
  end
  
  private
  def order_params
    params.require(:order).permit(:customer_id, :order_status, :payment_method, :shipping_address, :postal_code, :name, :shipping, :total_amount) 
  end
end
