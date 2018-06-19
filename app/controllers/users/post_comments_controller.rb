class Users::PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_comment = post_comments.build(post_comment_params)
    @post_comment.user = current_user

    @post_comment.save!
    respond_to do |format|
      format.html do
        location = user_post_path(@post_comment.post.user, @post_comment.post)
        redirect_to location, notice: "Comment was successfully created."
      end
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:body)
  end

  def post_comments
    User.find(params[:user_id]).posts.find(params[:post_id]).comments
  end
end
