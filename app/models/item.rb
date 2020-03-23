class Item < ApplicationRecord

    belongs_to :genre
    # has_many :carts, dependent: :destroy
    has_many :order_details, dependent: :destroy
    attachment :image

    enum sale_status: {販売中: 0, 売切れ: 1}

end
