class Users::PostsController < ApplicationController
  def index
    @posts = user_posts
  end

  def show
    @post = user_posts.find(params[:id])
  end

  private

  def user_posts
    User.find(params[:user_id]).posts
  end
end
