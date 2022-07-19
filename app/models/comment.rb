class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates :comment_body, length: { maximum: 100 }
end
