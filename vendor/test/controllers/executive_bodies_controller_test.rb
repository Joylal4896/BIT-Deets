require 'test_helper'

class ExecutiveBodiesControllerTest < ActionController::TestCase
  setup do
    @executive_body = executive_bodies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:executive_bodies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create executive_body" do
    assert_difference('ExecutiveBody.count') do
      post :create, executive_body: { club: @executive_body.club, email: @executive_body.email, fb_link: @executive_body.fb_link, name: @executive_body.name, phone: @executive_body.phone, role: @executive_body.role, twitter_link: @executive_body.twitter_link }
    end

    assert_redirected_to executive_body_path(assigns(:executive_body))
  end

  test "should show executive_body" do
    get :show, id: @executive_body
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @executive_body
    assert_response :success
  end

  test "should update executive_body" do
    patch :update, id: @executive_body, executive_body: { club: @executive_body.club, email: @executive_body.email, fb_link: @executive_body.fb_link, name: @executive_body.name, phone: @executive_body.phone, role: @executive_body.role, twitter_link: @executive_body.twitter_link }
    assert_redirected_to executive_body_path(assigns(:executive_body))
  end

  test "should destroy executive_body" do
    assert_difference('ExecutiveBody.count', -1) do
      delete :destroy, id: @executive_body
    end

    assert_redirected_to executive_bodies_path
  end
end
