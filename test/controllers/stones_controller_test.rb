require "test_helper"

class StonesControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
  test "should get index" do
    get stones_index_url
    assert_response :success
  end

  test "should get show" do
    get stones_show_url
    assert_response :success
  end

=======
>>>>>>> 7d910294967fcfaf1ccb9a41e1fea3622cc8c9af
  test "should get new" do
    get stones_new_url
    assert_response :success
  end

  test "should get create" do
    get stones_create_url
    assert_response :success
  end
<<<<<<< HEAD

  test "should get update" do
    get stones_update_url
    assert_response :success
  end

  test "should get edit" do
    get stones_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get stones_destroy_url
    assert_response :success
  end
=======
>>>>>>> 7d910294967fcfaf1ccb9a41e1fea3622cc8c9af
end
