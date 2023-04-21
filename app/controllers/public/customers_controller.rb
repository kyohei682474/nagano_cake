class Public::CustomersController < ApplicationController
    def show
        @customer = current_customer

    end

    def edit
        @customer = current_customer
    end

    def update
        customer = current_customer
        customer.update(current_customer)
        redirect_to  public_customers_my_page_path
    end

    def unsubscribe
        @customer = current_customer
    end

    def withdrawal
    end

  private
    def current_params
        params.require(:current).permit(:last_name, :first_name, :last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:email)
    end

end
