require 'test_helper'

class SpotifyUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get spotify_users_create_url
    assert_response :success
  end

end
