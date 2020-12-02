require 'test_helper'

class Customers::AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_addresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get customers_addresses_edit_url
    assert_response :success
  end

end
