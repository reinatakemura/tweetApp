class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find_by(id: params[:post_id])
    @like = current_user.likes.create(post_id: params[:post_id])
    @like.save
    redirect_to posts_path
    # redirect_to post_path(@post.id)
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
    redirect_to post_path
  end
end
