class Post < ApplicationRecord
  belongs_to :category
  belongs_to :genre
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments
  
  #いいねしているのがログイン中のユーザーかどうか
  def favorited?(user)
   favorites.where(user_id: user.id).exists?
  end
end
