class Report < ApplicationRecord
  belongs_to :reporter, class_name: "User"
  belongs_to :reported, class_name: "User" 
  
  enum status: { outstanding: 0, closed: 1, unnecessary: 2 }
end
