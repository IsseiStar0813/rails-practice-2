require 'test_helper'

class DeleteMicropostTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:issei)
    @micropost = microposts(:orange)
  end
  
  test "should be deleted" do
    log_in_as(@user)
    get user_path(@user)
    assert_template "users/show"
    assert_difference "Micropost.count", -1 do
      delete micropost_path(@micropost)
    end
    assert_not flash.nil?
    assert_redirected_to root_url
  end
  
  
end
