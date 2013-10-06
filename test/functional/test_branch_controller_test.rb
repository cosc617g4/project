require 'test_helper'

class TestBranchControllerTest < ActionController::TestCase
  test "should get brad" do
    get :brad
    assert_response :success
  end

end
