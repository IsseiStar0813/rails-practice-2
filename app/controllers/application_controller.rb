class ApplicationController < ActionController::Base
  include SessionsHelper
  
  # ログイン済みのユーザーか確認
    def logged_in_user
      unless session[:user_id]
        flash[:warning] = "ログインしてください"
        redirect_to login_url
      end
    end
    
   
end
