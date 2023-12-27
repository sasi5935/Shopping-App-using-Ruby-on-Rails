class AddIsVendorsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :isvendors, :string
  end
end
