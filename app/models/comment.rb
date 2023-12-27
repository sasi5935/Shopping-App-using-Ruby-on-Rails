# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  story_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_story_id  (story_id)
#  index_comments_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (story_id => stories.id)
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :story

  # Validation
  validates :body, presence: true
  
end
