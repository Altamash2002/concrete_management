require "application_system_test_case"

class StrengthTestingsTest < ApplicationSystemTestCase
  setup do
    @strength_testing = strength_testings(:one)
  end

  test "visiting the index" do
    visit strength_testings_url
    assert_selector "h1", text: "Strength testings"
  end

  test "should create strength testing" do
    visit strength_testings_url
    click_on "New strength testing"

    click_on "Create Strength testing"

    assert_text "Strength testing was successfully created"
    click_on "Back"
  end

  test "should update Strength testing" do
    visit strength_testing_url(@strength_testing)
    click_on "Edit this strength testing", match: :first

    click_on "Update Strength testing"

    assert_text "Strength testing was successfully updated"
    click_on "Back"
  end

  test "should destroy Strength testing" do
    visit strength_testing_url(@strength_testing)
    click_on "Destroy this strength testing", match: :first

    assert_text "Strength testing was successfully destroyed"
  end
end
