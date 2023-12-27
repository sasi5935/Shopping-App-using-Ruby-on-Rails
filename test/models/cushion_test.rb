# == Schema Information
#
# Table name: cushions
#
#  id         :bigint           not null, primary key
#  emoji_type :string
#  image_url  :string
#  name       :string
#  price      :decimal(, )
#  shape      :string
#  stock      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class CushionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
