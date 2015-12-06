class DropSupplierTable < ActiveRecord::Migration
  def change
    drop_table :suppliers
  end
end
