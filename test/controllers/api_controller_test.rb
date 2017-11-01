require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get tickets:string" do
    get api_tickets:string_url
    assert_response :success
  end

  test "should get hf_users:string" do
    get api_hf_users:string_url
    assert_response :success
  end

  test "should get :count" do
    get api_:count_url
    assert_response :success
  end

end
