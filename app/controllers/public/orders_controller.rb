class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @orders = Order.all
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def order_confirm
    
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method]
    @orders = Order.all
    @orders = current_customer.cart_items
    @add = params[:order][:add]
 
    case @add
      when '1'
        @order.postal_code = current_customer.postal_code
        @order.shipping_address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name
      when '2'
        address = Address.find(params[:order][:address])
        @order.postal_code = address.postal_code
        @order.shipping_address = address.address
        @order.name = address.name
      when '3'  
        
        @order.postal_code = params[:order][:postal_code]
        @order.shipping_address = params[:order][:shipping_address]
        @order.name = params[:order][:name]
    end
    # 表示内容：支払い方法（payment支払いについてenum設定）、お届け先、カートに入れた商品情報(hiddenfeildを使う)
  end

  def complete
    
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.order_status = "入金待ち"
    if @order.save
      cart_items = current_customer.cart_items
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart_item.amount
        order_detail.production_status = "着手不可"
        order_detail.price = cart_item.item.price
        order_detail.save
     end 
     
    cart_items.destroy_all
    redirect_to public_orders_complete_path
    
    else
      
      redirect_to public_orders_order_confirm
    end
    
  end

  def index
    @order = Order.new
    @order = current_customer.address
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    # byebug
  end
  
  private
  # ストロングパラメータ
  def order_params
    params.require(:order).permit(:shipping_address, :postal_code, :name, :shipping, :total_amount, :payment_method) 
  end
end
