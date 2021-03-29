class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    
  end

  def update
    cart_item = CartItem.find(params[:id]) 
    cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id]) 
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  def create
    # byebug
      cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id], customer_id: params[:cart_item][:customer_id])    #DBからdataがあるか確認
    if cart_item.nil?
      cart_item = CartItem.new(cart_item_params)
      cart_item.customer_id = current_customer.id
      cart_item.save
    else
      obj = cart_item_params
      obj[:amount] = obj[:amount].to_i + cart_item.amount 
      cart_item.update(obj)
      
    end
    redirect_to public_cart_items_path
  end
  
  private
  # ストロングパラメータ
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount) 
  end
end
