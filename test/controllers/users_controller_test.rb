require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test "should get new" do
    get new_user_path
    assert_response :success
  end

  test "should redirect index when not logged in" do
    get user_path(@user)
    assert_redirected_to login_path
  end

  test "should redirect playlist when not logged in" do
    get playlist_path(:one)
    assert_redirected_to login_path
  end

end
