require 'test_helper'

class Bitotsav::OrganisersControllerTest < ActionController::TestCase
  setup do
    @bitotsav_organiser = bitotsav_organisers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bitotsav_organisers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bitotsav_organiser" do
    assert_difference('Bitotsav::Organiser.count') do
      post :create, bitotsav_organiser: { Activity: @bitotsav_organiser.Activity, Name: @bitotsav_organiser.Name, Rating: @bitotsav_organiser.Rating, Role: @bitotsav_organiser.Role, Team: @bitotsav_organiser.Team }
    end

    assert_redirected_to bitotsav_organiser_path(assigns(:bitotsav_organiser))
  end

  test "should show bitotsav_organiser" do
    get :show, id: @bitotsav_organiser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bitotsav_organiser
    assert_response :success
  end

  test "should update bitotsav_organiser" do
    patch :update, id: @bitotsav_organiser, bitotsav_organiser: { Activity: @bitotsav_organiser.Activity, Name: @bitotsav_organiser.Name, Rating: @bitotsav_organiser.Rating, Role: @bitotsav_organiser.Role, Team: @bitotsav_organiser.Team }
    assert_redirected_to bitotsav_organiser_path(assigns(:bitotsav_organiser))
  end

  test "should destroy bitotsav_organiser" do
    assert_difference('Bitotsav::Organiser.count', -1) do
      delete :destroy, id: @bitotsav_organiser
    end

    assert_redirected_to bitotsav_organisers_path
  end
end
