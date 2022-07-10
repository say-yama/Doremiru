class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  
  #いいねしているのがログイン中のユーザーかどうか
  def favorited?(user)
   favorites.where(user_id: user.id).exists?
  end
end
