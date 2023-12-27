class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_story, only: [:create] # Un-comment this line

  skip_before_action :verify_authenticity_token, only: [:create]

  # def create
  #   @comment = @story.comments.create(comment_params.merge(user_id: current_user.id))
  # end

  def create
    @comment = @story.comments.create(comment_params.merge(user_id: current_user.id))
  
    respond_to do |format|
      if @comment.save
        format.html { redirect_to stories_url, notice: 'Comment was successfully created.' }
        format.js   # This will look for 'create.js.erb' template
      else
        format.html { render :new }
        format.js
      end
    end
  end

  private

  def set_story
    @story = Story.find(params[:story_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end