class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.integer :cushion_id
      t.integer :cart_id
      t.integer :quantity
      t.string :size
      t.string :fabric
      t.string :firmness
      t.string :stuffing

      t.timestamps
    end
  end
end
