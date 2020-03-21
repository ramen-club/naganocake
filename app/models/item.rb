class Item < ApplicationRecord

    belongs_to :genre
    has_many :carts, dependent: :destroy
    has_many :order_details, dependent: :destroy
    attachment :image

    enum sale_status: {on_sale: 0, out_of_sale: 1}

end
