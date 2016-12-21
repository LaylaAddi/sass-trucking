require 'test_helper'

class Conversations::TextMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get conversations_text_messages_index_url
    assert_response :success
  end

end
