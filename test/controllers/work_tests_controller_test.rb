require "test_helper"

class WorkTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_test = work_tests(:one)
  end

  test "should get index" do
    get work_tests_url
    assert_response :success
  end

  test "should get new" do
    get new_work_test_url
    assert_response :success
  end

  test "should create work_test" do
    assert_difference("WorkTest.count") do
      post work_tests_url, params: { work_test: { actual_working_time: @work_test.actual_working_time, date: @work_test.date, end_time: @work_test.end_time, start_time: @work_test.start_time } }
    end

    assert_redirected_to work_test_url(WorkTest.last)
  end

  test "should show work_test" do
    get work_test_url(@work_test)
    assert_response :success
  end

  test "should get edit" do
    get edit_work_test_url(@work_test)
    assert_response :success
  end

  test "should update work_test" do
    patch work_test_url(@work_test), params: { work_test: { actual_working_time: @work_test.actual_working_time, date: @work_test.date, end_time: @work_test.end_time, start_time: @work_test.start_time } }
    assert_redirected_to work_test_url(@work_test)
  end

  test "should destroy work_test" do
    assert_difference("WorkTest.count", -1) do
      delete work_test_url(@work_test)
    end

    assert_redirected_to work_tests_url
  end
end
