class CreatePurchaseHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cushion, null: false, foreign_key: true
      t.datetime :purchase_date
      t.integer :quantity
      t.decimal :total_price

      t.timestamps
    end
  end
end
