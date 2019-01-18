require 'test_helper'

class JournalsControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get journals_view_url
    assert_response :success
  end

end
