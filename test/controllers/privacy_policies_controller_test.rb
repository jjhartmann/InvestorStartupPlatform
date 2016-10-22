require 'test_helper'

class PrivacyPoliciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @privacy_policy = privacy_policies(:one)
  end

  test "should get index" do
    get privacy_policies_url
    assert_response :success
  end

  test "should get new" do
    get new_privacy_policy_url
    assert_response :success
  end

  test "should create privacy_policy" do
    assert_difference('PrivacyPolicy.count') do
      post privacy_policies_url, params: { privacy_policy: { content: @privacy_policy.content, header: @privacy_policy.header } }
    end

    assert_redirected_to privacy_policy_url(PrivacyPolicy.last)
  end

  test "should show privacy_policy" do
    get privacy_policy_url(@privacy_policy)
    assert_response :success
  end

  test "should get edit" do
    get edit_privacy_policy_url(@privacy_policy)
    assert_response :success
  end

  test "should update privacy_policy" do
    patch privacy_policy_url(@privacy_policy), params: { privacy_policy: { content: @privacy_policy.content, header: @privacy_policy.header } }
    assert_redirected_to privacy_policy_url(@privacy_policy)
  end

  test "should destroy privacy_policy" do
    assert_difference('PrivacyPolicy.count', -1) do
      delete privacy_policy_url(@privacy_policy)
    end

    assert_redirected_to privacy_policies_url
  end
end
