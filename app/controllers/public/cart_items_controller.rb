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
        #@cart_item = CartItem.new(cart_item_params)
        #@cart_item.customer_id = current_customer.id

        #cart_item.save
        #redirect_to cart_items_path

        @cart_item = current_customer.cart_items.new(cart_item_params)
		if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
		   #current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).amount += params[:cart_item][:amount].to_i
		   cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
           cart_item.amount += params[:cart_item][:amount].to_i
		   #current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).save
		   cart_item.save

			flash[:notice] = "商品がカートに追加されました"
			redirect_to cart_items_path


		elsif @cart_item.save
			flash[:notice] = "New Item was successfully added to cart."
			redirect_to cart_items_path
		else

			render 'end_users/items/show'
		end

    end

    def destroy
        cart_item  = CartItem.find(params[:id])  # データ（レコード）を1件取得
        cart_item.destroy  # データ（レコード）を削除
        redirect_to cart_items_path# 投稿一覧画面へリダイレクト
    end

    def destroy_all
        cart_items = CartItem.all
        cart_items.destroy_all
        redirect_to cart_items_path

    end



    private
    def cart_item_params
     params.require(:cart_item).permit(:item_id,:amount)
    end

end
