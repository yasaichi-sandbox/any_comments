require "application_system_test_case"

class Users::PostsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit user_posts_url(@user)
    assert_selector "h1", text: "Posts"
  end
end
