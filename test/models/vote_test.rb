# == Schema Information
#
# Table name: votes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  caption_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_votes_on_caption_id  (caption_id)
#  index_votes_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (caption_id => captions.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class VoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
