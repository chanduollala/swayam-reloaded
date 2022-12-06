require "test_helper"

class CollegesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @college = colleges(:one)
  end

  test "should get index" do
    get colleges_url, as: :json
    assert_response :success
  end

  test "should create college" do
    assert_difference("College.count") do
      post colleges_url, params: { college: { address: @college.address, faculty: @college.faculty, name: @college.name, phone: @college.phone } }, as: :json
    end

    assert_response :created
  end

  test "should show college" do
    get college_url(@college), as: :json
    assert_response :success
  end

  test "should update college" do
    patch college_url(@college), params: { college: { address: @college.address, faculty: @college.faculty, name: @college.name, phone: @college.phone } }, as: :json
    assert_response :success
  end

  test "should destroy college" do
    assert_difference("College.count", -1) do
      delete college_url(@college), as: :json
    end

    assert_response :no_content
  end
end
