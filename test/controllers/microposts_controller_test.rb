require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:issei)
    @micropost = microposts(:orange)
    @other_micropost = microposts(:strawberry)
  end

  test "should redirect create when not logged in" do
    assert_no_difference "Micropost.count" do
      post microposts_path, params:{micropost: {content: "こんにちは"}}
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference "Micropost.count" do
      delete micropost_path(@micropost)
    end
    assert_redirected_to login_url
  end
  
   test "should not be deleted for wrong micropost" do
    log_in_as(@user)
    assert_no_difference 'Micropost.count' do
      delete micropost_path(@other_micropost)
    end
    assert_redirected_to root_url
  end
end
