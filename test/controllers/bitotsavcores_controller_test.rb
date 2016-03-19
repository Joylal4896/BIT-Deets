require 'test_helper'

class BitotsavcoresControllerTest < ActionController::TestCase
  setup do
    @bitotsavcore = bitotsavcores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bitotsavcores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bitotsavcore" do
    assert_difference('Bitotsavcore.count') do
      post :create, bitotsavcore: { contact: @bitotsavcore.contact, email: @bitotsavcore.email, fblink: @bitotsavcore.fblink, name: @bitotsavcore.name }
    end

    assert_redirected_to bitotsavcore_path(assigns(:bitotsavcore))
  end

  test "should show bitotsavcore" do
    get :show, id: @bitotsavcore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bitotsavcore
    assert_response :success
  end

  test "should update bitotsavcore" do
    patch :update, id: @bitotsavcore, bitotsavcore: { contact: @bitotsavcore.contact, email: @bitotsavcore.email, fblink: @bitotsavcore.fblink, name: @bitotsavcore.name }
    assert_redirected_to bitotsavcore_path(assigns(:bitotsavcore))
  end

  test "should destroy bitotsavcore" do
    assert_difference('Bitotsavcore.count', -1) do
      delete :destroy, id: @bitotsavcore
    end

    assert_redirected_to bitotsavcores_path
  end
end
