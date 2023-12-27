class PurchaseHistoriesController < ApplicationController
    def index
        @purchase_histories = PurchaseHistory.where(user_id: current_user.id)
    end
    
    def show
        @purchase_history = PurchaseHistory.find(params[:id])
    end
end
