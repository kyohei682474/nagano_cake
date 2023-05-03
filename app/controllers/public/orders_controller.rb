class Public::OrdersController < ApplicationController
    def new
        @order = Order.new
        @addresses = Address.where(customer_id:current_customer.id)

    end

    def confirm
         @order = Order.new(order_params)
        #  @address = Address.find(params[:order][:address_id])
        #  @order.delivery_target_postal_code = @address.postal_code
        #  @order.delivery_address = @address.address
        #  @order.delivery_target_full_name =@address.name
         select_address = params[:order][:select_address]
         #binding.pry
         if select_address == '0'
             puts 'test1'
         elsif select_address == '1'
             @address = Address.find(params[:order][:address_id])
             @order.customer_id = current_customer.id
             @order.delivery_target_postal_code = @address.postal_code
             @order.delivery_address = @address.address
             @order.delivery_target_full_name =@address.name
              #puts 'test2'
              #binding.pry
         elsif select_address == '2'
              puts 'test3'
         end

    end

    def complete
    end

    def create
        order = Order.new(order_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
        order.save
    # 4. トップ画面へリダイレクト
        redirect_to '/orders/confirm'
    end

    def show
    end

    def index
    end

    private
    def order_params
        params.require(:order).permit(:payment_method, :delivery_target_postal_code,:current_customer_address,:delivery_address,:delivery_target_full_name)
    end
end
