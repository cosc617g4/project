require 'test_helper'

class TestBranchControllerManishControllerTest < ActionController::TestCase
  test "should get manish" do
    get :manish
    assert_response :success
  end

end
