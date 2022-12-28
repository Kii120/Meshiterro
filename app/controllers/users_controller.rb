class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    
    # .post_imagesで特定のユーザの投稿すべてを持ってこれる
    # .allはユーザ関係なく全部
    # @post_images = @user.post_images
    
    # 1ページ分の決められた数のデータのみ，新しい順に取得．kaminariによって実装できるようになった
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
