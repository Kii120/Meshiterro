class PostCommentsController < ApplicationController

  def create
    # ここはcommnetのcontrolllerだからこれのparams[]の部分を:idにしちゃうとcommentのidになっちゃう
    post_image = PostImage.find(params[:post_image_id])


    comment = current_user.post_comments.new(post_comment_params)
    # comment = PostComment.new(post_comment_params)
    # comment.user_id = current_user.id    と同じ処理!
    # current_userが入力した(のidがはいった)post_commentレコードをcommentに

    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image.id)
  end
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
