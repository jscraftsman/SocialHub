require 'test_helper'

class PageControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get customize" do
    get :customize
    assert_response :success
  end

  test "should get settings" do
    get :settings
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get news" do
    get :news
    assert_response :success
  end

  test "should get chat" do
    get :chat
    assert_response :success
  end

  test "should get jokes" do
    get :jokes
    assert_response :success
  end

  test "should get inbox" do
    get :inbox
    assert_response :success
  end

end
