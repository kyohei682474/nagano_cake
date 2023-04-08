class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :customer
      t.integer :status,                      null: false
      t.integer :payment_method,              null: false
      t.integer :amount_billed,               null: false
      t.integer :shipping_fee,                null: false
      t.string  :delivery_target_postal_code, null: false
      t.string  :delivery_address,            null: false
      t.string  :delivery_target_full_name,   null: false

   
    end
  end
end
