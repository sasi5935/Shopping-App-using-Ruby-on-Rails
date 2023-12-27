# == Schema Information
#
# Table name: purchase_histories
#
#  id            :bigint           not null, primary key
#  fabric        :string
#  firmness      :string
#  purchase_date :datetime
#  quantity      :integer
#  size          :string
#  stuffing      :string
#  total_price   :decimal(, )
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  cushion_id    :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_purchase_histories_on_cushion_id  (cushion_id)
#  index_purchase_histories_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (cushion_id => cushions.id)
#  fk_rails_...  (user_id => users.id)
#
class PurchaseHistory < ApplicationRecord
    belongs_to :user
    belongs_to :cushion
  
    # Add validations as needed
  end
