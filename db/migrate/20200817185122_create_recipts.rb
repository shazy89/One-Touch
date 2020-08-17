class CreateRecipts < ActiveRecord::Migration[6.0]
  def change
    create_table :recipts do |t|

      t.timestamps
    end
  end
end
