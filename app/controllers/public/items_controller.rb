class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
    @item = Item.all

  end

  def show
    @item = Item.find(params[:id])
    @cart_items = CartItem.new
    # @item_sum = (@item.price * 1.1).floor
  end
end
