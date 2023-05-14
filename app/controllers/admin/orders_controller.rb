class Admin::OrdersController < ApplicationController
    def show
        @order = Order.find(params[:id])

    end

    def update

    end

    def order_params
        params.require(:corder).permit(:customer_id, :status, :payment_method,:amount_billed,:shipping_fee,:delivery_target_postal_code,:delivery_address,:delivery_target_full_name,:created_at,:updated_at)
    end

end
