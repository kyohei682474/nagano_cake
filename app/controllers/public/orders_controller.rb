class Public::OrdersController < ApplicationController
    before_action :authenticate_customer!

    def new
        if CartItem.find_by(customer_id: current_customer.id)
           @order = Order.new
           @addresses = Address.where(customer_id: current_customer.id)
        else
          flash[:notice] = "商品カートが空です"
          redirect_to cart_items_path
        end





    end

    def confirm

         @order = current_customer.orders.new(order_params)




        #  @address = Address.find(params[:order][:address_id])
        #  @order.delivery_target_postal_code = @address.postal_code
        #  @order.delivery_address = @address.address
        #  @order.delivery_target_full_name =@address.name
         select_address = params[:order][:select_address]
         #binding.pry
         if select_address == '0'
             @order.delivery_target_postal_code = current_customer.postal_code
             @order.delivery_address = current_customer.address
             @order.delivery_target_full_name = current_customer.last_name + current_customer.first_name
         elsif select_address == '1'
             @address = Address.find(params[:order][:address_id])
             @order.customer_id = current_customer.id
             @order.delivery_target_postal_code = @address.postal_code
             @order.delivery_address = @address.address
             @order.delivery_target_full_name =@address.name
         elsif select_address == '2'

         end

         @cart_items = current_customer.cart_items.all
         render :new if @order.invalid?



    end

    def complete
    end

    def create
     order = current_customer.orders.new(order_params)
     order.save

      current_customer.cart_items.each do |cart_item|
      @ordered_detail = OrderDetail.new
      @ordered_detail.item_id = cart_item.item_id
      @ordered_detail.amount = cart_item.amount
      @ordered_detail.with_tax_price = (cart_item.item.price*1.10).floor
      @ordered_detail.order_id = order.id
      @ordered_detail.save!
     end

        current_customer.cart_items.destroy_all #カートの中身を削除
        redirect_to orders_complete_path

    end

    def show
        @order = current_customer.orders.find(params[:id])

        @total = 0

    end

    def index
        @orders = current_customer.orders.all

    end

    private
    def order_params
        params.require(:order).permit(:payment_method, :delivery_target_postal_code,:delivery_address,:delivery_target_full_name, :customer_id, :shipping_fee, :amount_billed, :status)
    end
end
