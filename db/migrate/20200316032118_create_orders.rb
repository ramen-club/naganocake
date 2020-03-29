class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer "customer_id"
      t.integer "payment_method"
      t.integer "postage"  #送料
      t.integer "charge"  #注文確定時の商品の税込合計金額
      t.string  "name"
      t.string  "postal_code"
      t.string  "street_address"
      t.integer "order_status", default: 0

      t.timestamps
    end
  end
end
