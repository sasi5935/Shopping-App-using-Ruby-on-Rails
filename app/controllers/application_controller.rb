# frozen_string_literal: true

class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:home]

    helper_method :current_cart

    # def current_cart
    #     if session[:cart_id]
    #     Cart.find(session[:cart_id])
    #     else
    #     Cart.create
    #     end
    # end

    def current_cart
        begin
          Cart.find(session[:cart_id])
        rescue ActiveRecord::RecordNotFound
          cart = Cart.create
          session[:cart_id] = cart.id
          cart
        end
    end
end
