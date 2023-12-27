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
class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :caption

  # Ensures a user can only vote once per caption
  validates :user_id, uniqueness: { scope: :caption_id }
end
