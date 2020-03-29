class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string "name"
      t.text "description"
      t.integer "genre_id"
      t.integer "price"  #商品の税抜金額
      t.string "image_id"
      t.integer "sale_status", default: 0, null: false
      t.timestamps
    end
  end
end
