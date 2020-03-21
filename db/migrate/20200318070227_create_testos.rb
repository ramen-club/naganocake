class CreateTestos < ActiveRecord::Migration[5.2]
  def change
    create_table :testos do |t|

      t.timestamps
    end
  end
end
