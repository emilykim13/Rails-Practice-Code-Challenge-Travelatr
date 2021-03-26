class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :like_post]
    before_action :set_form, only: [:new, :edit]

    def new
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
        @destination = @post.destination
        @author = @post.blogger
        @content = @post.content
        @likes = @post.likes
    end
    
    def create
        @post = Post.create(post_params)
        @post.likes = 0
        if @post.valid?
            redirect_to @post
        else
            redirect_to new_post_path(post)
        end
    end

    def update
        @post = Post.create(post_params)
        if @post.valid?
            redirect_to @post
        else
            render :edit
        end
    end

    def like_post
        updated_likes = @post.likes + 1
        @post.update(likes: updated_likes)
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :destination_id, :blogger_id)
    end
    
    def find_post
        @post = Post.find(params[:id])
    end

    def set_form
        @bloggers = Blogger.all
        @destinations = Destination.all
        @posts = Post.all
    end

end
