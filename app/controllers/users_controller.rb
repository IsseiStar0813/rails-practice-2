class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      # 登録成功時
      flash[:success] = "ユーザー登録に成功しました"
      redirect_to @user
    else
      # 登録失敗時
      render "new"
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  private
    
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
