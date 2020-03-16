class CreateDelivers < ActiveRecord::Migration[5.2]
  def change
    create_table :delivers do |t|

      t.integer "customer_id"
      t.string  "name"
      t.string  "postal_code"
      t.string  "street_address"

      t.timestamps
    end
  end
end
