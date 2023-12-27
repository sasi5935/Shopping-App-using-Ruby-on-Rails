class AddStockToCushions < ActiveRecord::Migration[7.0]
  def change
    add_column :cushions, :stock, :integer
  end
end
