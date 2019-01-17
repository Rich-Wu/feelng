require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get entries_create_url
    assert_response :success
  end

  test "should get read" do
    get entries_read_url
    assert_response :success
  end

  test "should get delete" do
    get entries_delete_url
    assert_response :success
  end

end
