class Admin::OrdersController < ApplicationController
    def show
        @order = Order.find(params[:id])


    end

    def update
        order = Order.find(params[:id])
        order.update(order_params)
        redirect_to admin_order_path(order.id)

    end

    def order_params
        params.require(:order).permit(:customer_id, :status, :payment_method,:amount_billed,:shipping_fee,:delivery_target_postal_code,:delivery_address,:delivery_target_full_name,:created_at,:updated_at)
    end

end
