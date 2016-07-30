require 'test_helper'

class Home::HomePageControllerTest < ActionDispatch::IntegrationTest
  test "should get showStartups" do
    get home_home_page_showStartups_url
    assert_response :success
  end

  test "should get showInvestors" do
    get home_home_page_showInvestors_url
    assert_response :success
  end

  test "should get features" do
    get home_home_page_features_url
    assert_response :success
  end

  test "should get trending" do
    get home_home_page_trending_url
    assert_response :success
  end

end
