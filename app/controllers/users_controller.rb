class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      # 登録成功時
    else
      # 登録失敗時
      render "new"
    end
  end
  
  def show
  end
  
  private
    
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
