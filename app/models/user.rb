class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reports, class_name: "Report", foreign_key: "reporter_id", dependent: :destroy
  has_many :reverse_of_reports, class_name: "Report", foreign_key: "reported_id", dependent: :destroy

  enum status: {status_active: 0, withdrawal: 1, deactivate: 2}

  # アカウントのアイコン画像
  def get_icon
   unless image.attached?
     file_path = Rails.root.join("app/assets/images/megane.png")
     image.attach(io: File.open(file_path), filename: "default-image.png", content_type: "image/png")
   end
  # image.variant(gravity: :center, resize: "100x100", crop: "100x100x0x0").processed
   image.variant(resize_to_fill: [200, 200])
  end

  # 退会済のアカウントのログイン不可
   def active_for_authentication?
    super && status_active?
   end

end
