class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  
  validates :comment, presence: true, langth: { maximum: 200 }
end
