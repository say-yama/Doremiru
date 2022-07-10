class Gunre < ApplicationRecord
  has_many :posts
  
    # enum name: {action: 0, mystery: 1, sf: 2, fantagy: 3,romance: 4, horror_suspense: 5, comedy: 6, animated: 7, human: 8, historycal: 9, other: 10}
end
