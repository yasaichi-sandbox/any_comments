require 'test_helper'

class Users::PostCommentsControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  setup do
    @user = users(:one)
    @comment_user = users(:two)
    @user_post = @user.posts.create!(title: "ねこかいたい", body: "")
    @user_post_comment = @user_post.comments.create!(body: "", user: @comment_user)

    login_as(@comment_user, scope: :user)
  end

  test "should create users_post_comment" do
    assert_difference('PostComment.count') do
      params = { post_comment: { body: "" } }
      post user_post_comments_url(@user, @user_post), params: params
    end

    assert_redirected_to user_post_url(@user, @user_post)
  end
end
