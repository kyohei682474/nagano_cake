class Admin::OrderDetailsController < ApplicationController


    def update
        order_detail = OrderDetail.find(params[:id])
        order = Order.find(order_detail.order_id)
        order_details = order.order_details.all

        order_detail.update(order_detail_params)

        if
           order_detail.making_status == "production"
           order.update(status:2)

        else
           change_status(order_details,order)
         end
        redirect_to admin_order_path(order_detail.order.id)
    end



private

     def change_status(order_details,order)
          order_details.each do |order_detail|
           if order_detail.making_status != "production_completed"
              return
           end
           end
           order.update(status:3)
     end
     def order_detail_params
        params.require(:order_detail).permit(:making_status)
     end
end