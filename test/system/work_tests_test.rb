require "application_system_test_case"

class WorkTestsTest < ApplicationSystemTestCase
  setup do
    @work_test = work_tests(:one)
  end

  test "visiting the index" do
    visit work_tests_url
    assert_selector "h1", text: "Work tests"
  end

  test "should create work test" do
    visit work_tests_url
    click_on "New work test"

    fill_in "Actual working time", with: @work_test.actual_working_time
    fill_in "Date", with: @work_test.date
    fill_in "End time", with: @work_test.end_time
    fill_in "Start time", with: @work_test.start_time
    click_on "Create Work test"

    assert_text "Work test was successfully created"
    click_on "Back"
  end

  test "should update Work test" do
    visit work_test_url(@work_test)
    click_on "Edit this work test", match: :first

    fill_in "Actual working time", with: @work_test.actual_working_time
    fill_in "Date", with: @work_test.date
    fill_in "End time", with: @work_test.end_time
    fill_in "Start time", with: @work_test.start_time
    click_on "Update Work test"

    assert_text "Work test was successfully updated"
    click_on "Back"
  end

  test "should destroy Work test" do
    visit work_test_url(@work_test)
    click_on "Destroy this work test", match: :first

    assert_text "Work test was successfully destroyed"
  end
end
