class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Item.page(params[:page]).per(10)
    #@item = Item.find(params[:id])
  end  
  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_item_path(item)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
  end
  
  private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :is_active) 
  end
end
