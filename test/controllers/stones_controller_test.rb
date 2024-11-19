require "test_helper"

class StonesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get stones_new_url
    assert_response :success
  end

  test "should get create" do
    get stones_create_url
    assert_response :success
  end
end
