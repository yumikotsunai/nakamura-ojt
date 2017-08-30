require 'test_helper'

class ApicontrolControllerTest < ActionController::TestCase
  test "should get apicontrol" do
    get :apicontrol
    assert_response :success
  end

end
