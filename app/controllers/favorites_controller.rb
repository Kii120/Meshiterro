class FavoritesController < ApplicationController

  def create
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.new(post_image_id: post_image.id)
    favorite.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    redirect_to post_image_path(post_image)
  end

  # .findはparamsに保存されているデータを引っ張ってくるとき
  # .find_byはparamsではなくそのまま保存しているデータを引っ張ってくるとき
  # (params[post_image_id])はparamsに保存されているデータ
  # (post_image_id: post_image.id)はparamsに保存されていないデータ．書き方が違うだけで意味は
end
