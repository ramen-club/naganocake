class OrderDetail < ApplicationRecord

	belongs_to :order
	belongs_to :item

	enum production_status: {
        着手不可: 0,
        製作待ち: 1,
        製作中: 2,
        製作完了: 3
    }

    def total_price
        price = 0
        order_details.each do |order_detail|
          price +=  order_detail.item.price * order_detail.count
        end
    end

end
