class PostComment < ApplicationRecord
  
  # モデル同士の関連だけ書けばOK
  # これでuser_idとかpost_image_idを意味のあるものにできる
  belongs_to :user
  belongs_to :post_image
  
end
