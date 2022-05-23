class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.where(id: params[:id]).first
        if @post.nil? 
            redirect_to '/posts'
        end
    end

    def create
        @post = current_user.posts.new(post_params)
        if @post.save
            redirect_to user_path(current_user)
        else
            @user = current_user
            @posts = @user.posts.paginate(page: params[:page], per_page: 5)
            render 'users/show', status: 422
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to user_path(current_user)
        else
            render 'posts/edit', status: 422
        end
    end
    private

    def post_params
        params.require(:post).permit(:title, :description)
    end
end
