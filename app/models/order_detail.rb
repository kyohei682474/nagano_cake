class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item



     # with_tax_price属性を追加
  attr_accessor :with_tax_price

  # with_tax_price=メソッドを定義
  def with_tax_price=(price)
    self.price = price / 1.1
  end
  enum making_status: { production_not_allowed: 0, waiting_for_production:1, production:2, production_completed:3}
  #def sum
   #with_tax_price * amount
  #end
  
  

end
