require 'test_helper'

class SpotifyLoginsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get spotify_logins_create_url
    assert_response :success
  end

end
