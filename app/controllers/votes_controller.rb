class VotesController < ApplicationController
    before_action :authenticate_user!
  before_action :set_caption

  def create
    @caption.votes.where(user_id: current_user.id).first_or_create
    redirect_to captions_path
  end

  def destroy
    @vote = @caption.votes.where(user_id: current_user.id)
    @vote.destroy_all if @vote
    redirect_to captions_path
  end

  private

  def set_caption
    @caption = Caption.find(params[:caption_id])
  end
end
