class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      if @order_detail.production_status == "製作中"
        @order_detail.order.update(order_status:"製作中")
      elsif  @order_detail.order.order_details.count == @order_detail.order.order_details.where(production_status:"製作完了").count
        @order_detail.order.update(order_status:"発送準備中")
      end
      redirect_to admin_order_path(@order_detail.order_id)
    end
  end
  
  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status) 
  end
end
