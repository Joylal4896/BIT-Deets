require 'test_helper'

class Admin::Update::ClubsControllerTest < ActionController::TestCase
  setup do
    @admin_update_club = admin_update_clubs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_update_clubs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_update_club" do
    assert_difference('Admin::Update::Club.count') do
      post :create, admin_update_club: { clubdesc: @admin_update_club.clubdesc, clubname: @admin_update_club.clubname, clubquote: @admin_update_club.clubquote, clubweblink: @admin_update_club.clubweblink, videolink: @admin_update_club.videolink }
    end

    assert_redirected_to admin_update_club_path(assigns(:admin_update_club))
  end

  test "should show admin_update_club" do
    get :show, id: @admin_update_club
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_update_club
    assert_response :success
  end

  test "should update admin_update_club" do
    patch :update, id: @admin_update_club, admin_update_club: { clubdesc: @admin_update_club.clubdesc, clubname: @admin_update_club.clubname, clubquote: @admin_update_club.clubquote, clubweblink: @admin_update_club.clubweblink, videolink: @admin_update_club.videolink }
    assert_redirected_to admin_update_club_path(assigns(:admin_update_club))
  end

  test "should destroy admin_update_club" do
    assert_difference('Admin::Update::Club.count', -1) do
      delete :destroy, id: @admin_update_club
    end

    assert_redirected_to admin_update_clubs_path
  end
end
