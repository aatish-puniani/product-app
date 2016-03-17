class AddStockStatusToProducts < ActiveRecord::Migration
  def change
    add_column :products, :stock, :string
  end
end
