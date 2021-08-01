class MicropostsController < ApplicationController
  
  before_action :logged_in_user, only:[:create, :destroy]
  before_action :correct_user, only: :destroy
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      # 投稿成功
      flash[:success] = "投稿しました"
      redirect_to root_url
    else
      # 投稿失敗
      flash.now[:warning] = "投稿内容に誤りがあります"
      render "static_pages/home"
    end
  end
  
  def destroy
    @micropost.destroy
     flash[:success] = "削除しました"
     redirect_to root_url
  end
  
  private
    
    def micropost_params
      params.require(:micropost).permit(:content)
    end
    
     def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
     end
    
   
end
