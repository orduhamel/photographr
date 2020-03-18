class AddProductstoClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :products, :text
  end
end
