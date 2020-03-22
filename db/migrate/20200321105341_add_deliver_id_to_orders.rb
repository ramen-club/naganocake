class AddDeliverIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :deliver_id, :integer
  end
end
