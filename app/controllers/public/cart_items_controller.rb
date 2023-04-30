class Public::CartItemsController < ApplicationController
    def index
        @cart_items = CartItem.all
        @total = 0


    end

    def update
        @cart_item = CartItem.find(params[:id])
        @cart_item.update(cart_item_params)
        redirect_to cart_items_path

    end

    def show
    end

    def create
        cart_item = CartItem.new(cart_item_params)
        cart_item.save
        redirect_to cart_items_path
    end

    def destroy
    end

    def destroy_all
    end



    def cart_item_params
     params.require(:cart_item).permit(:item_id,:customer_id,:amount)
    end

end
