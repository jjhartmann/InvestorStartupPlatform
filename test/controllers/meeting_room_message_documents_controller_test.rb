require 'test_helper'

class MeetingRoomMessageDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meeting_room_message_document = meeting_room_message_documents(:one)
  end

  test "should get index" do
    get meeting_room_message_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_meeting_room_message_document_url
    assert_response :success
  end

  test "should create meeting_room_message_document" do
    assert_difference('MeetingRoomMessageDocument.count') do
      post meeting_room_message_documents_url, params: { meeting_room_message_document: { meeting_room_message_id: @meeting_room_message_document.meeting_room_message_id } }
    end

    assert_redirected_to meeting_room_message_document_url(MeetingRoomMessageDocument.last)
  end

  test "should show meeting_room_message_document" do
    get meeting_room_message_document_url(@meeting_room_message_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_meeting_room_message_document_url(@meeting_room_message_document)
    assert_response :success
  end

  test "should update meeting_room_message_document" do
    patch meeting_room_message_document_url(@meeting_room_message_document), params: { meeting_room_message_document: { meeting_room_message_id: @meeting_room_message_document.meeting_room_message_id } }
    assert_redirected_to meeting_room_message_document_url(@meeting_room_message_document)
  end

  test "should destroy meeting_room_message_document" do
    assert_difference('MeetingRoomMessageDocument.count', -1) do
      delete meeting_room_message_document_url(@meeting_room_message_document)
    end

    assert_redirected_to meeting_room_message_documents_url
  end
end
