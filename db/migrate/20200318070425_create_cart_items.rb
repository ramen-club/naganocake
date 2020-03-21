class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
   	  t.string "item_id"
   	  t.string "cart_id"
      t.timestamps
    end
  end
end
