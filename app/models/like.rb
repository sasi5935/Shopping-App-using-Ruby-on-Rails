# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  story_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_likes_on_story_id  (story_id)
#  index_likes_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (story_id => stories.id)
#  fk_rails_...  (user_id => users.id)
#
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :story

  validates_uniqueness_of :story_id, scope: :user_id
end
