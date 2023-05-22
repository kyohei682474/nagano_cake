class Admin::OrdersController < ApplicationController
    def show
        @order = Order.find(params[:id])
        @order_detail = @order.order_details


    end

    def update
        order = Order.find(params[:id])
        # order_detail = order.order_details
        order.update(order_params)
        # order_detail.update(order_detail)
        redirect_to admin_order_path(order.id)

    end

    def order_params
        params.require(:order).permit(:customer_id, :status, :payment_method,:amount_billed,:shipping_fee,:delivery_target_postal_code,:delivery_address,:delivery_target_full_name,:created_at,:updated_at,:making_status)
    end

    def order_detail_params
        params.require(:order_detail).permit(:making_status)
    end

end
