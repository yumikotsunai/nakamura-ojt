require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get controller" do
    get :controller
    assert_response :success
  end

  test "should get api" do
    get :api
    assert_response :success
  end

  test "should get controller" do
    get :controller
    assert_response :success
  end

end
