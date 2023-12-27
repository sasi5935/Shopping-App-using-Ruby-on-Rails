class CaptionsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

  def index
    @captions = Caption.includes(:votes).all
  end

  def new
    @caption = Caption.new
  end

  def create
    @caption = current_user.captions.build(caption_params)
    if @caption.save
      redirect_to captions_path, notice: 'Caption was successfully created.'
    else
      render :new
    end
  end

  private

  def caption_params
    params.require(:caption).permit(:content)
  end
end
