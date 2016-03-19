require 'test_helper'

class Bitotsav::VolunteersControllerTest < ActionController::TestCase
  setup do
    @bitotsav_volunteer = bitotsav_volunteers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bitotsav_volunteers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bitotsav_volunteer" do
    assert_difference('Bitotsav::Volunteer.count') do
      post :create, bitotsav_volunteer: { Activity: @bitotsav_volunteer.Activity, Name: @bitotsav_volunteer.Name, Rating: @bitotsav_volunteer.Rating, Role: @bitotsav_volunteer.Role, Team: @bitotsav_volunteer.Team }
    end

    assert_redirected_to bitotsav_volunteer_path(assigns(:bitotsav_volunteer))
  end

  test "should show bitotsav_volunteer" do
    get :show, id: @bitotsav_volunteer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bitotsav_volunteer
    assert_response :success
  end

  test "should update bitotsav_volunteer" do
    patch :update, id: @bitotsav_volunteer, bitotsav_volunteer: { Activity: @bitotsav_volunteer.Activity, Name: @bitotsav_volunteer.Name, Rating: @bitotsav_volunteer.Rating, Role: @bitotsav_volunteer.Role, Team: @bitotsav_volunteer.Team }
    assert_redirected_to bitotsav_volunteer_path(assigns(:bitotsav_volunteer))
  end

  test "should destroy bitotsav_volunteer" do
    assert_difference('Bitotsav::Volunteer.count', -1) do
      delete :destroy, id: @bitotsav_volunteer
    end

    assert_redirected_to bitotsav_volunteers_path
  end
end
