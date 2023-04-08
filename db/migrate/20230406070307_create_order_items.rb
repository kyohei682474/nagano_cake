class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.belongs_to :order,          null: false
      t.belongs_to :item,           null: false
      t.integer    :amount,         null: false
      t.integer    :price_on_order, null: false
      t.integer    :making_status,  default: false,null: false
      t.integer    :shipping_fee,   null: false
    end
  end
end
