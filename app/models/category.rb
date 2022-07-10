class Category < ApplicationRecord
 has_many :posts
 

  # enum name: {
  #   movie: 0,
  #   book: 1,
  #   comic: 2
  # }

end
