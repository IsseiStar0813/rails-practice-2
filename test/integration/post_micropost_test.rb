require 'test_helper'

class PostMicropostTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:issei)
  end
  
  test "Should be posted correctly" do
    log_in_as(@user)
    get root_url
    assert_template "static_pages/home"
    assert_difference "Micropost.count", +1 do
      post microposts_path, params:{micropost: {content: "こんにちは"}}
    end
    assert_not flash.nil?
    assert_redirected_to root_url
  end
  
  test "Should not be posted correctly" do
    log_in_as(@user)
    get root_url
    assert_template "static_pages/home"
    assert_no_difference "Micropost.count" do
      post microposts_path, params:{micropost: {content: ""}}
    end
    assert_not flash.nil?
  end
end
