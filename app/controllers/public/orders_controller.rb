class Public::OrdersController < ApplicationController
    def new
        @order = Order.new
        @addresses = Address.where(customer_id:current_customer.id)

    end

    def confirm
         @order = Order.new(order_params)


    end

    def complete
    end

    def create
    end

    def show
    end

    def index
    end

    private
    def order_params
        params.require(:order).permit(:payment_method, :postal_code, :address, :name)
    end
end
