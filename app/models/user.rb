class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  #1つのuser_idがたくさんのpost_imageモデルを持っている．
  # dependent: :destroyはidを削除したら投稿も全部消してくれる
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  # これによりprofile_imageという名前でActiveStrageで画像を保存できるようになった
  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    # 画像のサイズ変更(widthやheightを変数として扱える)．つまりget_profile_image(200,200)で呼び出せる
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
