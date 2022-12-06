require "test_helper"

class ParticipantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participant = participants(:one)
  end

  test "should get index" do
    get participants_url, as: :json
    assert_response :success
  end

  test "should create participant" do
    assert_difference("Participant.count") do
      post participants_url, params: { participant: { bio: @participant.bio, image: @participant.image, player_name: @participant.player_name, user_id: @participant.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show participant" do
    get participant_url(@participant), as: :json
    assert_response :success
  end

  test "should update participant" do
    patch participant_url(@participant), params: { participant: { bio: @participant.bio, image: @participant.image, player_name: @participant.player_name, user_id: @participant.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy participant" do
    assert_difference("Participant.count", -1) do
      delete participant_url(@participant), as: :json
    end

    assert_response :no_content
  end
end
