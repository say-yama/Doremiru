class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def get_icon
   unless image.attached?
     file_path = Rails.root.join("app/assets/images/megane.png")
     image.attach(io: File.open(file_path), filename: "default-image.png", content_type: "image/png")
   end
   image
  end

end
