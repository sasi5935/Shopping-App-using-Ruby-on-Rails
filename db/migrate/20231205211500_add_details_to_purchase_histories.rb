class AddDetailsToPurchaseHistories < ActiveRecord::Migration[7.0]
  def change
    add_column :purchase_histories, :size, :string
    add_column :purchase_histories, :fabric, :string
    add_column :purchase_histories, :firmness, :string
    add_column :purchase_histories, :stuffing, :string
  end
end
