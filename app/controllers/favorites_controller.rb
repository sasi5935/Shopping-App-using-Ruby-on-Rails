class FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    cushion = Cushion.find(params[:cushion_id])
    favorite = current_user.favorites.build(cushion: cushion)

    if favorite.save
      render json: { status: 'success', cushion_id: cushion.id }, status: :ok
    else
      render json: { status: 'error', message: favorite.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(cushion_id: params[:cushion_id])
    if favorite&.destroy
      render json: { status: 'success', cushion_id: params[:cushion_id] }, status: :ok
    else
      render json: { status: 'error', message: 'Favorite not found' }, status: :not_found
    end
  end

  private

  def set_cushion
    @cushion = Cushion.find(params[:cushion_id])
  end

end
