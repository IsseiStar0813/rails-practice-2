class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if session[:user_id]
  end

  def about
  end
end
