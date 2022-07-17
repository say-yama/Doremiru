require "test_helper"

class GunresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get gunres_new_url
    assert_response :success
  end
end
