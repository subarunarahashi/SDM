require "test_helper"

class AssignShiftControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get assign_shift_index_url
    assert_response :success
  end
end
