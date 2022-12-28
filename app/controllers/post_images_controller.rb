class PostImagesController < ApplicationController
  def new
    # データの空き箱を作る
    @post_image = PostImage.new
  end
  
  def create
    # "入力された"データが@post_imageに格納される
    @post_image = PostImage.new(post_image_params)
    # @post_image.user_idとは，↑で@post_imageに入ったuser_idカラムということ
    # current_user.idとはログイン中のユーザーのidのこと　deviseのみで使える
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
