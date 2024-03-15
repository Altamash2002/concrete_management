require "test_helper"

class StrengthTestingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @strength_testing = strength_testings(:one)
  end

  test "should get index" do
    get strength_testings_url
    assert_response :success
  end

  test "should get new" do
    get new_strength_testing_url
    assert_response :success
  end

  test "should create strength_testing" do
    assert_difference("StrengthTesting.count") do
      post strength_testings_url, params: { strength_testing: {  } }
    end

    assert_redirected_to strength_testing_url(StrengthTesting.last)
  end

  test "should show strength_testing" do
    get strength_testing_url(@strength_testing)
    assert_response :success
  end

  test "should get edit" do
    get edit_strength_testing_url(@strength_testing)
    assert_response :success
  end

  test "should update strength_testing" do
    patch strength_testing_url(@strength_testing), params: { strength_testing: {  } }
    assert_redirected_to strength_testing_url(@strength_testing)
  end

  test "should destroy strength_testing" do
    assert_difference("StrengthTesting.count", -1) do
      delete strength_testing_url(@strength_testing)
    end

    assert_redirected_to strength_testings_url
  end
end
