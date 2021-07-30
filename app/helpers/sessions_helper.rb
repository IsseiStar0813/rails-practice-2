module SessionsHelper
  
  # 渡されたユーザーでログイン
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # ログイン中のユーザーを返す
  def current_user
    if session[:user_id]
      return User.find_by(id: session[:user_id])
    end
  end
end
