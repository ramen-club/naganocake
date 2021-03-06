class Order < ApplicationRecord

    belongs_to :customer
    has_many :order_details, dependent: :destroy
    has_many :items, through: :order_details

    enum order_status: {
        入金待ち: 0,
        入金確認: 1,
        製作中: 2,
        発送準備中: 3,
        発送済み: 4,
    }

    enum payment_method: {
         クレジットカード: 1,
         銀行振込: 0,
    }


    def total_price
        price = 0
        order_details.each do |order_detail|
          price +=  order_detail.item.price * order_detail.count
        end
    end

    # enum deliver_id: { Customer.deliver.id.all }
end
