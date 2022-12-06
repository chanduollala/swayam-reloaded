require "test_helper"

class ProgramTeamDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program_team_datum = program_team_data(:one)
  end

  test "should get index" do
    get program_team_data_url, as: :json
    assert_response :success
  end

  test "should create program_team_datum" do
    assert_difference("ProgramTeamDatum.count") do
      post program_team_data_url, params: { program_team_datum: { data: @program_team_datum.data, program_id: @program_team_datum.program_id, team_id: @program_team_datum.team_id } }, as: :json
    end

    assert_response :created
  end

  test "should show program_team_datum" do
    get program_team_datum_url(@program_team_datum), as: :json
    assert_response :success
  end

  test "should update program_team_datum" do
    patch program_team_datum_url(@program_team_datum), params: { program_team_datum: { data: @program_team_datum.data, program_id: @program_team_datum.program_id, team_id: @program_team_datum.team_id } }, as: :json
    assert_response :success
  end

  test "should destroy program_team_datum" do
    assert_difference("ProgramTeamDatum.count", -1) do
      delete program_team_datum_url(@program_team_datum), as: :json
    end

    assert_response :no_content
  end
end
