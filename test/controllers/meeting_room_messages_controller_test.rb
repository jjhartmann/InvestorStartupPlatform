require 'test_helper'

class MeetingRoomMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meeting_room_message = meeting_room_messages(:one)
  end

  test "should get index" do
    get meeting_room_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_meeting_room_message_url
    assert_response :success
  end

  test "should create meeting_room_message" do
    assert_difference('MeetingRoomMessage.count') do
      post meeting_room_messages_url, params: { meeting_room_message: { meeting_member_id: @meeting_room_message.meeting_member_id, meeting_room_id: @meeting_room_message.meeting_room_id, message_id: @meeting_room_message.message_id } }
    end

    assert_redirected_to meeting_room_message_url(MeetingRoomMessage.last)
  end

  test "should show meeting_room_message" do
    get meeting_room_message_url(@meeting_room_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_meeting_room_message_url(@meeting_room_message)
    assert_response :success
  end

  test "should update meeting_room_message" do
    patch meeting_room_message_url(@meeting_room_message), params: { meeting_room_message: { meeting_member_id: @meeting_room_message.meeting_member_id, meeting_room_id: @meeting_room_message.meeting_room_id, message_id: @meeting_room_message.message_id } }
    assert_redirected_to meeting_room_message_url(@meeting_room_message)
  end

  test "should destroy meeting_room_message" do
    assert_difference('MeetingRoomMessage.count', -1) do
      delete meeting_room_message_url(@meeting_room_message)
    end

    assert_redirected_to meeting_room_messages_url
  end
end
