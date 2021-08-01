class ApplicationController < ActionController::Base
  include SessionsHelper
  
  # ログイン済みのユーザーか確認
    def logged_in_user
      unless session[:user_id]
        flash[:warning] = "ログインしてください"
        redirect_to login_url
      end
    end
    
    # 正しいユーザーか確認
    def correct_user
      @user = User.find(params[:id])
      unless @user == current_user
        redirect_to login_url
      end
    end
end
