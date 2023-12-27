class AddImageUrlToCartItems < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :image_url, :string
  end
end
