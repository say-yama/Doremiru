class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  def get_icon
   unless image.attached?
     file_path = Rails.root.join("app/assets/images/megane.png")
     image.attach(io: File.open(file_path), filename: "default-image.png", content_type: "image/png")
   end
  # image.variant(gravity: :center, resize: "100x100", crop: "100x100x0x0").processed
   image.variant(resize_to_fill: [200, 200])
  end

end
