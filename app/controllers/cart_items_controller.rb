class CartItemsController < ApplicationController
    # before_action :set_cart, only: [:create]
    before_action :set_cart

    def create
        @cart_item = @cart.cart_items.new(cart_item_params)

        if @cart_item.save

          @cart_item.update(image_url: @cart_item.cushion.image_url) if @cart_item.cushion.image_url.present?

          redirect_to cart_path, notice: 'Item added to cart.'
        else
          render 'cushions/show', alert: 'There was a problem adding the item to the cart.'
        end
    end


    def destroy
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
        respond_to do |format|
          format.html { redirect_to cart_url, notice: 'Item was successfully removed.' }
          format.json { head :no_content }
        end
    end


    private

    def set_cart
      @cart = current_cart
    end

    def cart_item_params
        params.require(:cart_item).permit(:cushion_id, :quantity, :size, :fabric, :firmness, :stuffing, :image_url)
    end

  end
