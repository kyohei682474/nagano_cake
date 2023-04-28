class Public::CartItemsController < ApplicationController
    def index
        @cart_items = Cart_item.all
    end
    
    def update
    end
    
    def show
    end
    
    def create
    end
   
    def destroy
    end
    
    def destroy_all
    end
end
