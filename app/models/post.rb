class Post < ApplicationRecord
  belongs_to :category
  belongs_to :genre
  belongs_to :user
  belongs_to :book
  has_many :favorites, dependent: :destroy
  has_many :comments

  validates :post_title, presence: true, length: { maximum: 30 }
  validates :post_body, length: { maximum: 400 }
  scope :comics, -> { where(category_id: 2) }
  scope :books, -> { where(category_id: 1) }

  # いいねしているのがログイン中のユーザーかどうか
  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

  # 作品サーチの時のアクション
  def self.search(search_params)
    return if search_params.nil?
    # where("title LIKE ?", "%#{search_params[:search]}%").where(category_id: search_params[:category_id]).where(genre_id: search_params[:genre_id])
    where("title LIKE ?", "%#{search_params[:search]}%").
      where("category_id LIKE ?", "%#{search_params[:category_id]}%").
      where("genre_id LIKE ?", "%#{search_params[:genre_id]}%")
  end
end
