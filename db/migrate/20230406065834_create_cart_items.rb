class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.belongs_to :item
      t.belongs_to :customer
      t.integer :amount,      null: false
      
      

 
    end
  end
end
