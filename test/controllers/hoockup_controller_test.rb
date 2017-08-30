require 'test_helper'

class HoockupControllerTest < ActionController::TestCase
  test "should get getcode" do
    get :getcode
    assert_response :success
  end

end
