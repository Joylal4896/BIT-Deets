require 'test_helper'

class Admin::Update::ExecutiveBodiesControllerTest < ActionController::TestCase
  setup do
    @admin_update_executive_body = admin_update_executive_bodies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_update_executive_bodies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_update_executive_body" do
    assert_difference('Admin::Update::ExecutiveBody.count') do
      post :create, admin_update_executive_body: { club: @admin_update_executive_body.club, contact: @admin_update_executive_body.contact, fb_link: @admin_update_executive_body.fb_link, name: @admin_update_executive_body.name, role: @admin_update_executive_body.role, role_first_char: @admin_update_executive_body.role_first_char, twitter_link: @admin_update_executive_body.twitter_link }
    end

    assert_redirected_to admin_update_executive_body_path(assigns(:admin_update_executive_body))
  end

  test "should show admin_update_executive_body" do
    get :show, id: @admin_update_executive_body
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_update_executive_body
    assert_response :success
  end

  test "should update admin_update_executive_body" do
    patch :update, id: @admin_update_executive_body, admin_update_executive_body: { club: @admin_update_executive_body.club, contact: @admin_update_executive_body.contact, fb_link: @admin_update_executive_body.fb_link, name: @admin_update_executive_body.name, role: @admin_update_executive_body.role, role_first_char: @admin_update_executive_body.role_first_char, twitter_link: @admin_update_executive_body.twitter_link }
    assert_redirected_to admin_update_executive_body_path(assigns(:admin_update_executive_body))
  end

  test "should destroy admin_update_executive_body" do
    assert_difference('Admin::Update::ExecutiveBody.count', -1) do
      delete :destroy, id: @admin_update_executive_body
    end

    assert_redirected_to admin_update_executive_bodies_path
  end
end
