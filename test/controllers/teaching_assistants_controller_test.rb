require "test_helper"

class TeachingAssistantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teaching_assistants_index_url
    assert_response :success
  end
end
