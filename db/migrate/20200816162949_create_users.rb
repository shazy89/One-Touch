class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :contact_number
      t.boolean :admin
      t.boolean :employee
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
