class CreateDelivers < ActiveRecord::Migration[5.2]
  def change
    create_table :delivers do |t|

      t.timestamps
    end
  end
end
