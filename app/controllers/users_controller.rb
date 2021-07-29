class UsersController < ApplicationController
  
  before_action :logged_in_user, only:[:edit, :update]
  before_action :correct_user, only:[:edit, :update]
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      # 登録成功時
      log_in(@user)
      flash[:success] = "ユーザー登録に成功しました"
      redirect_to @user
    else
      # 登録失敗時
      render "new"
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to root_url
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # 更新成功
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to @user
    else
      # 更新失敗
      render "edit"
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  
  
  private
    
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
    
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
