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
class Cushion < ApplicationRecord

  has_many :favorites
  has_many :fans, through: :favorites, source: :user
  has_many :purchase_histories

  has_one_attached :image # If using Active Storage

  def reduce_stock(quantity)
    if stock.present? && stock >= quantity
      self.stock -= quantity
      save
    else
      # If stock isn't present or isn't enough, you can handle it accordingly
      errors.add(:stock, "not enough stock available")
      false
    end
  end

end
