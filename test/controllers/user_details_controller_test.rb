require "test_helper"

class UserDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_detail = user_details(:one)
  end

  test "should get index" do
    get user_details_url, as: :json
    assert_response :success
  end

  test "should create user_detail" do
    assert_difference("UserDetail.count") do
      post user_details_url, params: { user_detail: { dob: @user_detail.dob, email: @user_detail.email, firstname: @user_detail.firstname, gender: @user_detail.gender, image: @user_detail.image, lastname: @user_detail.lastname, phone1: @user_detail.phone1, phone2: @user_detail.phone2, user_id: @user_detail.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show user_detail" do
    get user_detail_url(@user_detail), as: :json
    assert_response :success
  end

  test "should update user_detail" do
    patch user_detail_url(@user_detail), params: { user_detail: { dob: @user_detail.dob, email: @user_detail.email, firstname: @user_detail.firstname, gender: @user_detail.gender, image: @user_detail.image, lastname: @user_detail.lastname, phone1: @user_detail.phone1, phone2: @user_detail.phone2, user_id: @user_detail.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy user_detail" do
    assert_difference("UserDetail.count", -1) do
      delete user_detail_url(@user_detail), as: :json
    end

    assert_response :no_content
  end
end
