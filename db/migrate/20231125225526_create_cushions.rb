class CreateCushions < ActiveRecord::Migration[7.0]
  def change
    create_table :cushions do |t|
      t.string :name
      t.decimal :price
      t.string :shape
      t.string :emoji_type
      t.string :image_url

      t.timestamps
    end
  end
end
