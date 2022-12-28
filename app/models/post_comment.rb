class PostComment < ApplicationRecord
  
  # モデル同士の関連だけ書けばOK
  belongs_to :user
  belongs_to :post_image
  
end
