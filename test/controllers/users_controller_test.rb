require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get update" do
    get users_update_url
    assert_response :success
  end

  test "should get likes" do
    get users_likes_url
    assert_response :success
  end

  test "should get check" do
    get users_check_url
    assert_response :success
  end

  test "should get withdrawal" do
    get users_withdrawal_url
    assert_response :success
  end
end
