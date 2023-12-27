# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cushion_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_favorites_on_cushion_id  (cushion_id)
#  index_favorites_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (cushion_id => cushions.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class FavoriteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
