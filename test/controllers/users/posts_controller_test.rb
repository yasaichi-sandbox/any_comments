require 'test_helper'

class Users::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = @user.posts.create!(title: "ねこかいたい", body: "")
  end

  test "should get index" do
    get user_posts_url(@user)
    assert_response :success
  end

  test "should show post" do
    get user_post_url(@user, @post)
    assert_response :success
  end
end
