require "test_helper"

class ShowReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get show_reports_index_url
    assert_response :success
  end
end
