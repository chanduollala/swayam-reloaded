require "test_helper"

class TeamParticipantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_participant = team_participants(:one)
  end

  test "should get index" do
    get team_participants_url, as: :json
    assert_response :success
  end

  test "should create team_participant" do
    assert_difference("TeamParticipant.count") do
      post team_participants_url, params: { team_participant: { is_lead: @team_participant.is_lead, participant_id: @team_participant.participant_id, team_id: @team_participant.team_id } }, as: :json
    end

    assert_response :created
  end

  test "should show team_participant" do
    get team_participant_url(@team_participant), as: :json
    assert_response :success
  end

  test "should update team_participant" do
    patch team_participant_url(@team_participant), params: { team_participant: { is_lead: @team_participant.is_lead, participant_id: @team_participant.participant_id, team_id: @team_participant.team_id } }, as: :json
    assert_response :success
  end

  test "should destroy team_participant" do
    assert_difference("TeamParticipant.count", -1) do
      delete team_participant_url(@team_participant), as: :json
    end

    assert_response :no_content
  end
end
