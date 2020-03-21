class ChangeIsActiveCustomers < ActiveRecord::Migration[5.2]
  def change
  	change_column :customers, :is_active, :boolean, default: true, null: true
  end
end
