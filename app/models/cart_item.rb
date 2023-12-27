# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  fabric     :string
#  firmness   :string
#  image_url  :string
#  quantity   :integer
#  size       :string
#  stuffing   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :integer
#  cushion_id :integer
#
class CartItem < ApplicationRecord
  has_one_attached :image
  belongs_to :cart
  belongs_to :cushion

  # You might want to validate presence and numericality of quantity, or ensure it's greater than 0
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
