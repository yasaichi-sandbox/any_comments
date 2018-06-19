require 'test_helper'

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  setup do
    @user = users(:one)
    @post = @user.posts.create!(title: "ねこかいたい", body: "")

    login_as(@comment_user = users(:two), scope: :user)
  end

  test "should create users_post_comment" do
    assert_difference('PostComment.count') do
      params = { post_comment: { body: "" } }
      post post_comments_url(@post), params: params
    end

    assert_redirected_to user_post_url(@user, @post)
  end
end
