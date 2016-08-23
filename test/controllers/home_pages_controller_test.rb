require 'test_helper'

class HomePagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @home_page = home_pages(:one)
  end

  test "should get index" do
    get home_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_home_page_url
    assert_response :success
  end

  test "should create home_page" do
    assert_difference('HomePage.count') do
      post home_pages_url, params: { home_page: {  } }
    end

    assert_redirected_to home_page_url(HomePage.last)
  end

  test "should show home_page" do
    get home_page_url(@home_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_home_page_url(@home_page)
    assert_response :success
  end

  test "should update home_page" do
    patch home_page_url(@home_page), params: { home_page: {  } }
    assert_redirected_to home_page_url(@home_page)
  end

  test "should destroy home_page" do
    assert_difference('HomePage.count', -1) do
      delete home_page_url(@home_page)
    end

    assert_redirected_to home_pages_url
  end
end
