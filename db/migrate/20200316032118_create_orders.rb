class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer "customer_id"
      t.integer "payment_method"
      t.integer "postage"
      t.integer "charge"
      t.string  "name"
      t.string  "postal_code"
      t.string  "street_address"
      t.integer "order_status"

      t.timestamps
    end
  end
end
