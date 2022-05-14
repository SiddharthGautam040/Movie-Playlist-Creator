require "test_helper"

class PlaylistsControllerTest < ActionDispatch::IntegrationTest

	test "should redirect login if not loged in and try geting playlists" do
    get new_playlists_path
    assert_redirected_to login_path
  end

end
