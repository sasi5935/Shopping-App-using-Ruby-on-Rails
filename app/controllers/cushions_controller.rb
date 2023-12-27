class CushionsController < ApplicationController
    before_action :set_cushion, only: %i[show edit update destroy]
    before_action :require_vendor_permission, only: %i[edit update destroy create]

    def home
        @cushions = Cushion.all
        if current_user.present?
            @favorite_cushions_ids = current_user.favorites.pluck(:cushion_id)
        end
    end

    def show
        @cushion = Cushion.find(params[:id])
        session[:last_viewed_cushion_id] = params[:id]
    end

    def favorite
        @cushions = Cushion.joins(:favorites).where(favorites: {user_id: current_user.id})
        @favorite_cushions_ids = current_user.favorites.pluck(:cushion_id)
    end

    def new
        @cushion = Cushion.new
    end

    def edit
        # @cushion is set by set_cushion
    end

    def create
      @cushion = Cushion.new(cushion_params)
        if @cushion.save
          redirect_to @cushion, notice: 'Cushion was successfully created.'
        else
          render :new, status: :unprocessable_entity
        end
    end

    def update
        if @cushion.update(cushion_params)
          redirect_to home_url, notice: 'Cushion was successfully updated.'
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @cushion = Cushion.find(params[:id])
        begin
            @cushion.destroy
            flash[:success] = 'Cushion was successfully destroyed.'
        rescue ActiveRecord::InvalidForeignKey
            # You can customize this message to be more user-friendly if you like
            flash[:error] = "Whoops! Looks like the cushion can't be deleted because it's part of a purchase history"
        end
        redirect_to home_url, status: :see_other
    end

    def index
        @cushions = Cushion.all
    end

    private

    def set_cushion
        @cushion = Cushion.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        redirect_to home_path, alert: 'Cushion not found.'
    end

    def cushion_params
        params.require(:cushion).permit(:name, :price, :shape, :emoji_type, :image)
    end

    def require_vendor_permission
        unless current_user&.isvendors == 'y'
          redirect_to root_path, notice: 'You do not have permission to perform this action.'
        end
    end

end
