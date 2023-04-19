class Public::CustomersController < ApplicationController
    def show
        @customer = current_customer

    end

    def edit
        @customer = current_customer
    end

    def update
    end

    def unsubscribe
    end

    def withdrawal
    end

  private
    def current_params
        params.require(:current).permit(:last_name, :first_name, :last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:email)
    end

end
