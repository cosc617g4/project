require 'test_helper'

class UserphotosControllerTest < ActionController::TestCase
  test "should get userphoto" do
    get :userphoto
    assert_response :success
  end

end
