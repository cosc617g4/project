require 'test_helper'

class PhototagsControllerTest < ActionController::TestCase
  setup do
    @phototag = phototags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phototags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phototag" do
    assert_difference('Phototag.count') do
      post :create, phototag: { photoid: @phototag.photoid, tag: @phototag.tag }
    end

    assert_redirected_to phototag_path(assigns(:phototag))
  end

  test "should show phototag" do
    get :show, id: @phototag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @phototag
    assert_response :success
  end

  test "should update phototag" do
    put :update, id: @phototag, phototag: { photoid: @phototag.photoid, tag: @phototag.tag }
    assert_redirected_to phototag_path(assigns(:phototag))
  end

  test "should destroy phototag" do
    assert_difference('Phototag.count', -1) do
      delete :destroy, id: @phototag
    end

    assert_redirected_to phototags_path
  end
end
