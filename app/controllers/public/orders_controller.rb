class Public::OrdersController < ApplicationController
    def new
        @order = Order.new
        @addresses = Address.where(customer_id:current_customer.id)

    end

    def confirm
        
    end

    def complete
    end

    def create
    end

    def show
    end

    def index
    end
end
