class Public::ItemsController < ApplicationController
 def index
  @items = Item.page(params[:page])
 end

 def show
  @item = Item.find(params[:id])
  @cart_item = CartItem.new

 end
 
 

  def item_params
    params.require(:item).permit(:genre_id, :name,:ntroduction,:price,:is_active)
  end
end
