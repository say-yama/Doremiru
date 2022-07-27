class Book < ApplicationRecord
  # idをisbnと同一にする
  self.primary_key = "isbn"
  has_many :posts, dependent: :destroy
end
