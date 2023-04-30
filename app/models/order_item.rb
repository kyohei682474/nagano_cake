class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :item
    has_many :order_items, dependent: :destroy
end
