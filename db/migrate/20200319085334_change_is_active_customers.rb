class ChangeIsActiveCustomers < ActiveRecord::Migration[5.2]
  def change
  	change_column :customers, :is_active, :integer, default: 1, null: false
  end
end
