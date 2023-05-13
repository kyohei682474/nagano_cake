class Admin::HomesController < ApplicationController
    def top
        @order_detail = OrderDetail.all
    end

    def about
    end
end
