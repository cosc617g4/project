require 'test_helper'

class AdministratorControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get marathon" do
    get :marathon
    assert_response :success
  end

end
