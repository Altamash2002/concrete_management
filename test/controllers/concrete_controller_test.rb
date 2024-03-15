require "test_helper"

class ConcreteControllerTest < ActionDispatch::IntegrationTest
  test "should get concrete_strength_record" do
    get concrete_concrete_strength_record_url
    assert_response :success
  end
end
