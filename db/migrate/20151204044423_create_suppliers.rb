class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.text :company_name
      t.text :first_name
      t.text :last_name
      t.text :phone_number
      t.text :email

      t.timestamps null: false
    end
  end
end
