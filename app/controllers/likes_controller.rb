class LikesController < ApplicationController
    before_action :authenticate_user!
  before_action :set_story

    def create
        @story = Story.find(params[:story_id])
        @story.likes.where(user_id: current_user.id).first_or_create

        redirect_to story_path(@story)
    end

    def destroy
        @story = Story.find(params[:story_id])
        @like = @story.likes.where(user_id: current_user.id)
        @like.destroy_all if @like

        redirect_to story_path(@story) 
    end
end
