require 'test_helper'

class NewsfeedControllerTest < ActionController::TestCase
  test "should get main" do
    get :main
    assert_response :success
  end

  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get remove" do
    get :remove
    assert_response :success
  end

  test "should get block" do
    get :block
    assert_response :success
  end

  test "should get unblock" do
    get :unblock
    assert_response :success
  end

end
