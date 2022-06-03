class CommentsController < ApplicationController

    before_action :check_user, only: [:create, :destroy, :edit, :update]

    def create
        @post = Post.find(params[:post_id])
        @post.comments.create(user_id: current_user.id, content: params['comment']['content'])
        redirect_to request.referrer
    end


    def edit
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
        redirect_to root_path unless @comment.user == current_user
    end

    def update
        @comment = Comment.find(params[:id])

        if @comment.update(content: params['comment']['content'])
            redirect_to posts_path
        else
            render 'posts', status: 422
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to request.referrer
    end


end
