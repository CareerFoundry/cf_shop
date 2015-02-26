class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :body, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }
end
