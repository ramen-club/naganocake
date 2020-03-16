class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|

      t.integer "order_id"
      t.integer "item_id"
      t.integer "count"
      t.integer "order_amount"
      t.integer "production_status"

      t.timestamps
    end
  end
end
