require 'test_helper'

class UsersDeleteTest < ActionDispatch::IntegrationTest
  
  def setup
   @user = users(:issei)
  end

 test "delete user" do
   log_in_as(@user)
   get edit_user_path(@user)
   assert_template 'users/edit'
   assert_select "a[href=?]",user_path, method: :delete
   assert_difference 'User.count', -1 do
      delete user_path
    end
   assert_not flash.empty?
   assert_redirected_to root_url
 end


end