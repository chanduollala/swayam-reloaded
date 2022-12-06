require "test_helper"

class ProblemStatementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @problem_statement = problem_statements(:one)
  end

  test "should get index" do
    get problem_statements_url, as: :json
    assert_response :success
  end

  test "should create problem_statement" do
    assert_difference("ProblemStatement.count") do
      post problem_statements_url, params: { problem_statement: { data: @problem_statement.data, team_id: @problem_statement.team_id, title: @problem_statement.title } }, as: :json
    end

    assert_response :created
  end

  test "should show problem_statement" do
    get problem_statement_url(@problem_statement), as: :json
    assert_response :success
  end

  test "should update problem_statement" do
    patch problem_statement_url(@problem_statement), params: { problem_statement: { data: @problem_statement.data, team_id: @problem_statement.team_id, title: @problem_statement.title } }, as: :json
    assert_response :success
  end

  test "should destroy problem_statement" do
    assert_difference("ProblemStatement.count", -1) do
      delete problem_statement_url(@problem_statement), as: :json
    end

    assert_response :no_content
  end
end
