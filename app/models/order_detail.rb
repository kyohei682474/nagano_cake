class OrderDetail < ApplicationRecord
    belongs_to :order

     # with_tax_price属性を追加
  attr_accessor :with_tax_price

  # with_tax_price=メソッドを定義
  def with_tax_price=(price)
    self.price = price / 1.1
  end

end
