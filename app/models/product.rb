class Product < ActiveRecord::Base
	has_many :orders
	has_many :comments

	validates :name, :price, :image_url, :color, presence: true
	validates :price, numericality: true

	def highest_rating_comment
		comments.rating_desc.first
	end

	def lowest_rating_comment
		comments.rating_asc.first
	end

	def average_rating
		comments.average(:rating).to_f
	end
end
