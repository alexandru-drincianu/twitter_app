class LikesController < ApplicationController

    before_action :check_user, only: [:create, :destroy]

    def create

        @post = Post.find(params[:post_id])

        if already_liked?
          flash[:notice] = "You can't like more than once"
        else
          @post.likes.create(user_id: current_user.id)
        end
        redirect_to request.referrer

    end

    def destroy
      
        @post = Post.find(params[:post_id])
        @like = @post.likes.find(params[:id])

        if !(already_liked?)
          flash[:notice] = "Cannot unlike"
        else
          @like.destroy
        end
        redirect_to request.referrer
    end


    private

    def already_liked?
        Like.where(user_id: current_user.id, post_id:
        params[:post_id]).exists?
    end
end
