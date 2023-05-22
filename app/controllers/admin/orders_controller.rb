class Admin::OrdersController < ApplicationController
    def show
        @order = Order.find(params[:id])
        @order_detail = @order.order_details


    end

    def update
        order = Order.find(params[:id])
        order_details = OrderDetail.where(order_id: params[:id])
        # order_detail = order.order_details
     if order.update(order_params)
        order_details.update_all(making_status: 1) if order.status == "payment_confirmation"
        # order_detail.update(order_detail)
     end
        redirect_to admin_order_path(order.id)

    end

    def order_params
        params.require(:order).permit(:customer_id, :status, :payment_method,:amount_billed,:shipping_fee,:delivery_target_postal_code,:delivery_address,:delivery_target_full_name,:created_at,:updated_at,:making_status)
    end


end
