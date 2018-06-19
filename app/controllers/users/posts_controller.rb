class Users::PostsController < ApplicationController
  def index
    @posts = user_posts
  end

  def show
    @post = user_posts.preload(comments: :user).find(params[:id])
    @new_comment = PostComment.new
  end

  private

  def user_posts
    User.find(params[:user_id]).posts
  end
end
