class Order < ApplicationRecord
    # has_many :items, dependent: :destroy
    belongs_to :customer
    has_many :order_details, dependent: :destroy

    enum payment_method: { credit_card: 0, transfer: 1 }
    enum status: {
     waiting_for_payment: 0,
     payment_confirmation: 1,
     production: 2,
     shipping_preparation: 3,
     shipped: 4
     }



   validates :payment_method, inclusion: {in: Order.payment_methods.keys}





   def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
   end
end
