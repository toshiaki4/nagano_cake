require 'test_helper'

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admin_orders_update_url
    assert_response :success
  end

end
