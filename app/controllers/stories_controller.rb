class StoriesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_story, only: [:show, :edit, :update, :destroy, :like, :unlike]
    before_action :check_owner, only: [:edit, :update, :destroy]
  
    def index
      @stories = Story.all
    end
  
    def show
        @comment = Comment.new
        @like = @story.likes.find_by(user_id: current_user.id) if user_signed_in?
    end
  
    def new
      @story = current_user.stories.build 
    end
  
    def create
      @story = current_user.stories.build(story_params)
      if @story.save
        redirect_to stories_url, notice: 'Story was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @story.update(story_params)
        redirect_to stories_url, notice: 'Story was successfully updated.'
      else
        render :edit
      end
    end
  

    def destroy
        @story.destroy
        redirect_to stories_url, notice: 'Story was successfully destroyed.'
    end
      
      

    def like
        @story.likes.create(user_id: current_user.id)
        redirect_back(fallback_location: root_path)
    end
    
    

    def unlike
        like = @story.likes.find_by(user_id: current_user.id)
        like.destroy if like
        redirect_back(fallback_location: root_path)
    end
  
    private

      def set_story
        @story = Story.find(params[:id])
      end
  
      def story_params
        params.require(:story).permit(:title, :content)
      end

      def find_story
        @story = Story.find(params[:id])
      end

      def check_owner
        redirect_to(root_url, notice: "Not authorized") if @story.user != current_user
      end
end
