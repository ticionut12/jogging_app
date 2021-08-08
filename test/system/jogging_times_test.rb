require "application_system_test_case"

class JoggingTimesTest < ApplicationSystemTestCase
  setup do
    @jogging_time = jogging_times(:one)
  end

  test "visiting the index" do
    visit jogging_times_url
    assert_selector "h1", text: "Jogging Times"
  end

  test "creating a Jogging time" do
    visit jogging_times_url
    click_on "New Jogging Time"

    fill_in "Date", with: @jogging_time.date
    fill_in "Distance", with: @jogging_time.distance
    fill_in "Total time", with: @jogging_time.total_time
    click_on "Create Jogging time"

    assert_text "Jogging time was successfully created"
    click_on "Back"
  end

  test "updating a Jogging time" do
    visit jogging_times_url
    click_on "Edit", match: :first

    fill_in "Date", with: @jogging_time.date
    fill_in "Distance", with: @jogging_time.distance
    fill_in "Total time", with: @jogging_time.total_time
    click_on "Update Jogging time"

    assert_text "Jogging time was successfully updated"
    click_on "Back"
  end

  test "destroying a Jogging time" do
    visit jogging_times_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Jogging time was successfully destroyed"
  end
end
