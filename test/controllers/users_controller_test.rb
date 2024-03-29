require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:issei)
    @other_user = users(:yuuka)
  end
  
  test "should get new" do
    get signup_path
    assert_response :success
  end
  
  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.nil?
    assert_redirected_to login_url
  end
  
  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert_not flash.nil?
    assert_redirected_to login_url
  end
  
  test "should redirect edit when not correct user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert_not flash.nil?
    assert_redirected_to login_url
  end
  
  test "should redirect update when not correct user" do
    log_in_as(@other_user)
    patch user_path(@user),params: { user: { name: @user.name,
                                              email: @user.email } }
    assert_not flash.nil?
    assert_redirected_to login_url
  end

end
