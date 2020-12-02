require 'test_helper'

class Customers::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customers_customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get customers_customers_edit_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get customers_customers_unsubscribe_url
    assert_response :success
  end

end
