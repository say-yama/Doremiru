class Post < ApplicationRecord
  belongs_to :category
  belongs_to :genre
  belongs_to :user
  belongs_to :book
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :post_title, presence: true, length: { maximum: 30 } #タイトルは30文字まで
  validates :post_body, length: { maximum: 400 } #内容は400字まで
  # 星レビューの数
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
  # ランキングで使用
  scope :comics, -> { where(category_id: 2) }
  scope :books, -> { where(category_id: 1) }

  # いいねしているのがログイン中のユーザーかどうか
  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

  # 投稿作品検索
  def self.search(search_params)
    return if search_params.nil?
    where("title LIKE ?", "%#{search_params[:search]}%").
      where("category_id LIKE ?", "%#{search_params[:category_id]}%").
      where("genre_id LIKE ?", "%#{search_params[:genre_id]}%")
  end
end
