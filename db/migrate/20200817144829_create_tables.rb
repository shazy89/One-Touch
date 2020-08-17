class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.integer :tabel_num
      t.decimal :sub_total

      t.timestamps
    end
  end
end
