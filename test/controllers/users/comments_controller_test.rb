require "test_helper"

class Users::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_comments_show_url
    assert_response :success
  end
end
