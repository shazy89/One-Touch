class CreateSelectItems < ActiveRecord::Migration[6.0]
  def change
    create_table :select_items do |t|
      t.integer :quantity
      t.decimal :price
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
