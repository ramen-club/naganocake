require 'test_helper'

class AdminCartsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_carts_new_url
    assert_response :success
  end

end
