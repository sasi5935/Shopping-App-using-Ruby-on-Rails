# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :cushions, through: :cart_items

  def add_cushion(cushion_id, quantity = 1)
    current_item = cart_items.find_by(cushion_id: cushion_id)
    if current_item
      current_item.quantity += quantity
    else
      current_item = cart_items.build(cushion_id: cushion_id)
    end
    current_item
  end


  def add_item(attributes)
    cart_item = cart_items.find_or_initialize_by(cushion_id: attributes[:cushion_id])
    cart_item.quantity += attributes[:quantity].to_i
    cart_item.save
    cart_item
  end

  def total_price
    cart_items.to_a.sum { |item| item.cushion.price * item.quantity }
  end

  def tax
    # Example tax calculation - adjust as necessary
    (total_price * 0.0825).round(2)
  end

  def final_total
    # Example calculation, assuming tax method exists
    total_price + tax # Add any additional fees or discounts as needed
  end

  def confirm_order
    # This method should include any logic required to finalize the order.
    # For example, it might: process a payment, update inventory, and log the order.

    if process_payment && update_inventory
      create_order_log
      cart_items.destroy_all  # Empty the cart.
      true  # Return true if everything went well.
    else
      false  # Return false if there was an issue.
    end
  end

  
  

  private

  # Placeholder method for processing payment.
  def process_payment
    # Implement payment processing here.
    # For example, integrate with a payment gateway like Stripe, PayPal, etc.
    true  # Return true if payment was successful.
  end

  # Placeholder method for updating inventory.
  def update_inventory
    # Deduct the quantities purchased from inventory.
    cart_items.each do |item|
      item.cushion.reduce_stock(item.quantity)  # Assuming `reduce_stock` is defined on Cushion.
    end
    true  # Return true if inventory update was successful.
  end

  # Placeholder method for creating an order log.
  def create_order_log
    # Log the order details to the database or an external system.
    true  # Return true if order log was successful.
  end


end
