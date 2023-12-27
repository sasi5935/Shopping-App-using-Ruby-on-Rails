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
require "test_helper"

class CartItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
