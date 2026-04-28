require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { avatar_url: @user.avatar_url, email: @user.email, full_name: @user.full_name, google_access_token: @user.google_access_token, google_token_expire_at: @user.google_token_expire_at, keycloak_uid: @user.keycloak_uid } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { avatar_url: @user.avatar_url, email: @user.email, full_name: @user.full_name, google_access_token: @user.google_access_token, google_token_expire_at: @user.google_token_expire_at, keycloak_uid: @user.keycloak_uid } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
