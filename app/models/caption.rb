# == Schema Information
#
# Table name: captions
#
#  id         :bigint           not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_captions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Caption < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy

  # Validations
  validates :content, presence: true
end
