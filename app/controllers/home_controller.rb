class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @cushions = Cushion.all
  end
  def cushion_filters
    filter = params[:filters]
    @cushions = Cushion.all.where(filter_helper("emoji_type",params[:emoji_type])).where(filter_helper("shape",params[:shape]))
    @cushions = params[:price].include?("low") ? @cushions.order(price: :asc) : @cushions.order(price: :desc) 
    respond_to do |format|
      format.js {render layout: false} # Add this line to you respond_to block
    end
  end

  private

  def filter_helper filter_by, filter
      filter.present? ? "#{filter_by} = '#{filter}'" : ""
  end


end
