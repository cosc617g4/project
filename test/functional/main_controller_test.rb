require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get tester" do
    get :tester
    assert_response :success
  end

end
