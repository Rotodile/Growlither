class PostsController < ApplicationController
    before_action :signed_in?, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
          flash[:success] = "Post created!"
          redirect_to root_url
        else
          @feed_items = []
          render 'static_pages/home'
        end
    end

    def index
      @posts = Post.all
    end

    def show
      @post = Post.find(params[:id])
    end

    def destroy
      @post.destroy
      flash[:success] = "Post deleted"
      redirect_to request.referrer || root_url  
    end

    private

    def post_params
      params.require(:post).permit(:content, :picture)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
