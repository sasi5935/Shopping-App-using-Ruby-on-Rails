class CheckoutController < ApplicationController
    before_action :set_cart, only: [:show, :confirm]

    # def show
    #     @cart = Cart.find(session[:cart_id]) # Or however you retrieve the current cart
    # end

    # def show
    #     if @cart.cart_items.empty?
    #       redirect_to cart_path, alert: 'Your cart is empty.'
    #     end
    #     # The @cart instance variable is used in the show view
    # end
    
    # Handles the order confirmation logic
    # def confirm
    #     # You would also handle payment processing here
    #     if @cart.cart_items.any? && @cart.confirm_order
    #       # Clear the session cart_id or reset the cart session as needed
    #       session[:cart_id] = nil
    #       redirect_to order_success_path, notice: 'Order placed Successfully'
    #     else
    #       redirect_to checkout_path, alert: 'There was a problem with your order.'
    #     end
    # end
    
    # # Renders a success message after order confirmation
    # def success
    #     # No additional logic needed if you're just displaying a static page
    # end
    
    # private
    
    # # Sets the @cart instance variable from the session
    # def set_cart
    #     # Make sure to handle cases where the cart does not exist or is not found
    #     if session[:cart_id].present?
    #       @cart = Cart.find_by(id: session[:cart_id])
    #       unless @cart
    #         session[:cart_id] = nil
    #         redirect_to new_cart_path, alert: 'Cart not found. Please start a new cart.'
    #       end
    #     else
    #       redirect_to new_cart_path, alert: 'No cart found. Please start shopping.'
    #     end
    # end

    # def confirm
    #     if @cart.cart_items.any? && @cart.confirm_order
    #       # Logic to process the order
    #       redirect_to order_success_path, notice: 'Order placed Successfully'
    #     else
    #       redirect_to checkout_path, alert: 'There was a problem with your order.'
    #     end
    # end

    def show
        if @cart.nil? || @cart.cart_items.empty?
          redirect_to carts_path, alert: 'Your cart is empty or not found.'
          return
        end
        
    end
    
    def confirm
      ActiveRecord::Base.transaction do
        final_price = @cart.final_total

        @cart.cart_items.each do |cart_item|
          PurchaseHistory.create!(
            user: current_user,
            cushion: cart_item.cushion,
            purchase_date: Time.current,
            quantity: cart_item.quantity,
            total_price: final_price,
            size: cart_item.size,
            fabric: cart_item.fabric,
            firmness: cart_item.firmness,
            stuffing: cart_item.stuffing
          )
        end
  
        @cart.cart_items.destroy_all
      end
  
      # redirect_to purchase_histories_path, notice: 'Purchase completed successfully!'
      redirect_to order_success_path, notice: 'Order placed Successfully'
    rescue => e
      redirect_to cart_path, alert: "Error processing your order: #{e.message}"
    end
    
    def success
        # Display success message
    end
    
    private
    
    def set_cart
        @cart = Cart.find_by(id: session[:cart_id])
    end

    def purchase_history_params
      params.require(:purchase_history).permit(:cushion_id, :user_id, :purchase_date, :quantity, :total_price, :size, :fabric, :firmness, :stuffing)
    end

end
