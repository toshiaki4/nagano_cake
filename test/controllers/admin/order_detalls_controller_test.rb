require 'test_helper'

class Admin::OrderDetallsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admin_order_detalls_update_url
    assert_response :success
  end

end
