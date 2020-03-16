class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.name "string"
      t.text "description"
      t.integer "genre_id"
      t.integer "price"
      t.string "image_id"
      t.integer "sale_status"
      t.timestamps
    end
  end
end
