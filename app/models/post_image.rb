class PostImage < ApplicationRecord
  
  has_one_attached :image
  # userモデルに属してる
  belongs_to :user
  
  # 複数形にする！
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  # 画像を貼らないとエラーになるの防ぐ
  # get_imageはアクションとは少し違う，メゾット名
  def get_image
    # if image.attached?
    #   image
    # else
    #   'no_image.jpg'
    # end
    
    # 以下の書き方だと，画像がない場合app/assets/imagesにあるno_image.jpgをデフォルト画像としてActiveStorageに格納し，格納した画像を表示するという意味
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_tipe: 'image/jpeg')
    end
    image
  end
  
  # favorited_by?メゾット
  # 与えたuserのidがfavoriteテーブル内に存在していればtrue，存在していなければfalse
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
