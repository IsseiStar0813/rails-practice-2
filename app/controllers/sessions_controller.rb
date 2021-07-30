class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ログイン処理
      log_in(user)
      flash[:success] = "ログインに成功しました"
      redirect_to user
    else
      # ログイン失敗時処理
      flash.now[:danger] = "メールアドレスまたはパスワードが違います"
      render "new"
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
