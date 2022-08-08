class Post < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum category: { book: 0, comic: 1 }
  enum genre: { romance: 0, fantazy: 1, action: 2, mystery: 3, sf: 4, horror: 5, comedy: 6, history: 7, human: 8, non_fiction: 9,
                gourmet: 10, sports: 11, business: 12, other: 13 }

  validates :post_title, presence: true, length: { maximum: 30 } #タイトルは30文字まで
  validates :post_body, length: { maximum: 400 } #内容は400字まで
  validates :category, presence: true
  validates :genre, presence: true
  # 星レビューの数
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
  # ランキングで使用
  scope :books, -> { Post.book }
  scope :comics, -> { Post.comic }

  # いいねしているのがログイン中のユーザーかどうか
  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

  # 投稿作品検索
  def self.search(search_params)
    rc=joins(:book).where("books.title LIKE ?", "%#{search_params[:search]}%")
    rc=rc.where(category: search_params[:category]) if search_params[:category].present?
    rc=rc.where(genre: search_params[:genre]) if search_params[:genre].present?
    return rc
  end
end
